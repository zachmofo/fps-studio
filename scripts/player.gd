extends CharacterBody3D

## I-9: walk/sprint/jump, heavy rifle, cover dummy, gun audio.

signal died

const MAX_HP := 3
const MAG_SIZE := 10
const RELOAD_SEC := 1.2
const PITCH_LIMIT := deg_to_rad(89.0)
const HITSCAN_RANGE := 50.0
const WORLD_AND_DUMMY := 1 | 4
const RECOIL_PITCH := deg_to_rad(1.8)
const RECOIL_YAW := deg_to_rad(0.35)
const RECOIL_SETTLE := 0.18
const RIFLE_KICK_PITCH := deg_to_rad(3.2)
const RIFLE_KICK_Z := 0.028
const FLASH_SEC := 0.09
const OBJ_DIM := Color(0.7, 0.7, 0.7, 1)
const OBJ_BRIGHT := Color(1, 1, 1, 1)

const SFX_FIRE: AudioStream = preload("res://audio/player_fire.tres")
const SFX_DRY: AudioStream = preload("res://audio/dry_fire.tres")
const SFX_RELOAD_MAG: AudioStream = preload("res://audio/reload_mag.tres")
const SFX_RELOAD_CLOSE: AudioStream = preload("res://audio/reload_close.tres")

@export var mouse_sensitivity: float = 0.0025
@export var walk_speed: float = 5.0
@export var sprint_speed: float = 8.0
@export var jump_velocity: float = 5.4

@onready var _camera: Camera3D = $Camera3D
@onready var _rifle: Node3D = $Camera3D/Rifle
@onready var _muzzle_flash: MeshInstance3D = $Camera3D/Rifle/MuzzleFlash
@onready var _hp_label: Label = $Hud/HpLabel
@onready var _ammo_label: Label = $Hud/AmmoLabel
@onready var _objective: Label = $Hud/ObjectiveLabel
@onready var _hit_flash: ColorRect = $Hud/HitFlash

var hp: int = MAX_HP
var ammo: int = MAG_SIZE
var _dead: bool = false
var _reloading: bool = false
var _gravity: float = 9.8
var _aim_pitch: float = 0.0
var _recoil_pitch: float = 0.0
var _recoil_yaw: float = 0.0
var _rifle_kick: float = 0.0
var _rifle_rest: Transform3D = Transform3D.IDENTITY
var _sfx_shot: AudioStreamPlayer
var _sfx_reload: AudioStreamPlayer


func _ready() -> void:
	add_to_group("player")
	_gravity = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
	_rifle_rest = _rifle.transform
	_sfx_shot = _make_sfx("SfxShot")
	_sfx_reload = _make_sfx("SfxReload")
	if _muzzle_flash:
		_muzzle_flash.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	_update_hp()
	_update_ammo()
	set_objective_cleared(false)


func _make_sfx(node_name: String) -> AudioStreamPlayer:
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.name = node_name
	add_child(p)
	return p


func _play(player: AudioStreamPlayer, stream: AudioStream) -> void:
	if player == null or stream == null:
		return
	player.stream = stream
	player.play()


func is_alive() -> bool:
	return not _dead


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_viewport().set_input_as_handled()
		return

	if event.is_action_pressed("reload"):
		_start_reload()
		get_viewport().set_input_as_handled()
		return

	if event.is_action_pressed("fire"):
		if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_viewport().set_input_as_handled()
			return
		if not _dead:
			_try_fire()
		get_viewport().set_input_as_handled()
		return

	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		_aim_pitch = clampf(
			_aim_pitch - event.relative.y * mouse_sensitivity,
			-PITCH_LIMIT,
			PITCH_LIMIT
		)
		_apply_view()


func _try_fire() -> void:
	if _reloading:
		return
	if ammo <= 0:
		_play(_sfx_shot, SFX_DRY)
		_start_reload()
		return
	ammo -= 1
	if ammo <= 0:
		_start_reload()
	_update_ammo()
	_play(_sfx_shot, SFX_FIRE)
	_kick()
	_show_muzzle()
	_hitscan()


func _hitscan() -> void:
	var space: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var from: Vector3 = _camera.global_position
	var to: Vector3 = from + (-_camera.global_transform.basis.z) * HITSCAN_RANGE
	var q: PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(from, to)
	q.exclude = [get_rid()]
	q.collision_mask = WORLD_AND_DUMMY
	var hit: Dictionary = space.intersect_ray(q)
	if hit.is_empty():
		return
	var col: Object = hit.get("collider") as Object
	if col != null and col.has_method("receive_hit"):
		col.receive_hit()


func _kick() -> void:
	_recoil_pitch += RECOIL_PITCH
	_recoil_yaw += randf_range(-RECOIL_YAW, RECOIL_YAW)
	_rifle_kick = 1.0
	_apply_view()


func _show_muzzle() -> void:
	if _muzzle_flash == null:
		return
	_muzzle_flash.visible = true
	await get_tree().create_timer(FLASH_SEC).timeout
	if _muzzle_flash:
		_muzzle_flash.visible = false


func _start_reload() -> void:
	if _dead or _reloading:
		return
	if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		return
	_reloading = true
	await get_tree().create_timer(0.28).timeout
	if _dead:
		_reloading = false
		return
	_play(_sfx_reload, SFX_RELOAD_MAG)
	await get_tree().create_timer(0.52).timeout
	if _dead:
		_reloading = false
		return
	_play(_sfx_reload, SFX_RELOAD_CLOSE)
	await get_tree().create_timer(0.40).timeout
	if _dead:
		_reloading = false
		return
	ammo = MAG_SIZE
	_reloading = false
	_update_ammo()


func take_damage(amount: int) -> void:
	if _dead:
		return
	hp = maxi(hp - amount, 0)
	_update_hp()
	_player_hit_flash()
	if hp <= 0:
		_die()


func _player_hit_flash() -> void:
	if _hit_flash == null:
		return
	_hit_flash.color = Color(0.85, 0.08, 0.06, 0.60)
	await get_tree().create_timer(0.06).timeout
	if _hit_flash == null:
		return
	var tw: Tween = create_tween()
	tw.tween_property(_hit_flash, "color:a", 0.0, 0.12)


func _die() -> void:
	_dead = true
	_reloading = false
	hp = 0
	_update_hp()
	died.emit()


func respawn_at(origin: Vector3, capture_mouse: bool = true) -> void:
	global_position = origin
	velocity = Vector3.ZERO
	hp = MAX_HP
	ammo = MAG_SIZE
	_dead = false
	_reloading = false
	_recoil_pitch = 0.0
	_recoil_yaw = 0.0
	_rifle_kick = 0.0
	if capture_mouse:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	_update_hp()
	_update_ammo()
	set_objective_cleared(false)
	_apply_view()


func _update_hp() -> void:
	if _hp_label:
		_hp_label.text = "HP %d" % hp


func _update_ammo() -> void:
	if _ammo_label:
		_ammo_label.text = "AMMO %d/%d" % [ammo, MAG_SIZE]


func set_objective_cleared(won: bool) -> void:
	if _objective == null:
		return
	if won:
		_objective.text = "CLEARED"
		_objective.add_theme_color_override("font_color", OBJ_BRIGHT)
	else:
		_objective.text = "CLEAR THE ROOM"
		_objective.add_theme_color_override("font_color", OBJ_DIM)


func _apply_view() -> void:
	_camera.rotation.x = clampf(_aim_pitch - _recoil_pitch, -PITCH_LIMIT, PITCH_LIMIT)
	_camera.rotation.y = _recoil_yaw
	if _rifle:
		var kick_xf: Transform3D = _rifle_rest
		kick_xf.origin.z += RIFLE_KICK_Z * _rifle_kick
		kick_xf.origin.y += 0.012 * _rifle_kick
		_rifle.transform = kick_xf
		_rifle.rotation.x = _rifle_rest.basis.get_euler().x - RIFLE_KICK_PITCH * _rifle_kick


func _physics_process(delta: float) -> void:
	if _recoil_pitch != 0.0 or _recoil_yaw != 0.0 or _rifle_kick > 0.0:
		_recoil_pitch = move_toward(_recoil_pitch, 0.0, (RECOIL_PITCH / RECOIL_SETTLE) * delta)
		_recoil_yaw = move_toward(_recoil_yaw, 0.0, (RECOIL_YAW / RECOIL_SETTLE) * delta)
		_rifle_kick = move_toward(_rifle_kick, 0.0, (1.0 / RECOIL_SETTLE) * delta)
		_apply_view()

	if not is_on_floor():
		velocity.y -= _gravity * delta

	if _dead:
		velocity.x = 0.0
		velocity.z = 0.0
		move_and_slide()
		return

	var jumping: bool = is_on_floor() and Input.is_action_just_pressed("jump")
	var grounded: bool = is_on_floor() and not jumping
	var speed: float = walk_speed
	if grounded and Input.is_action_pressed("sprint") and not Input.is_action_pressed("fire"):
		speed = sprint_speed

	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction: Vector3 = transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)
	direction.y = 0.0
	if direction.length_squared() > 0.0:
		direction = direction.normalized()
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	if jumping:
		velocity.y = jump_velocity

	move_and_slide()
