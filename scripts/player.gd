extends CharacterBody3D

## I-3: walk/look/jump, hitscan, 3 HP, die/respawn.

signal died

const MAX_HP := 3
const PITCH_LIMIT := deg_to_rad(89.0)
const HITSCAN_RANGE := 50.0
const WORLD_AND_DUMMY := 1 | 4

@export var mouse_sensitivity: float = 0.0025
@export var walk_speed: float = 5.0
@export var jump_velocity: float = 5.4

@onready var _camera: Camera3D = $Camera3D
@onready var _hp_label: Label = $Hud/HpLabel
@onready var _hit_flash: ColorRect = $Hud/HitFlash

var hp: int = MAX_HP
var _dead: bool = false
var _can_fire: bool = true
var _gravity: float = 9.8


func _ready() -> void:
	add_to_group("player")
	_gravity = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	_update_hp()


func is_alive() -> bool:
	return not _dead


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_viewport().set_input_as_handled()
		return

	if event.is_action_pressed("fire"):
		if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_viewport().set_input_as_handled()
			return
		if _can_fire and not _dead:
			_fire()
		get_viewport().set_input_as_handled()
		return

	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		_camera.rotation.x = clampf(
			_camera.rotation.x - event.relative.y * mouse_sensitivity,
			-PITCH_LIMIT,
			PITCH_LIMIT
		)


func _fire() -> void:
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
	_hit_flash.color = Color(0.85, 0.08, 0.06, 0.5)
	await get_tree().create_timer(0.15).timeout
	if _hit_flash:
		_hit_flash.color = Color(0.85, 0.08, 0.06, 0.0)


func _die() -> void:
	_dead = true
	_can_fire = false
	hp = 0
	_update_hp()
	died.emit()


func respawn_at(origin: Vector3, capture_mouse: bool = true) -> void:
	global_position = origin
	velocity = Vector3.ZERO
	hp = MAX_HP
	_dead = false
	_can_fire = true
	if capture_mouse:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	_update_hp()


func _update_hp() -> void:
	if _hp_label:
		_hp_label.text = "HP %d" % hp


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= _gravity * delta

	if _dead:
		velocity.x = 0.0
		velocity.z = 0.0
		move_and_slide()
		return

	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction: Vector3 = transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)
	direction.y = 0.0
	if direction.length_squared() > 0.0:
		direction = direction.normalized()
		velocity.x = direction.x * walk_speed
		velocity.z = direction.z * walk_speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity

	move_and_slide()
