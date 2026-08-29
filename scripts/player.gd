extends CharacterBody3D

## I-1: walk/look plus hitscan fire, 3 HP, die/respawn.

signal died

const MAX_HP := 3
const PITCH_LIMIT := deg_to_rad(89.0)
const HITSCAN_RANGE := 50.0
const WORLD_AND_DUMMY := 1 | 4

@export var mouse_sensitivity: float = 0.0025
@export var walk_speed: float = 5.0

@onready var _camera: Camera3D = $Camera3D
@onready var _hp_label: Label = $Hud/HpLabel

var hp: int = MAX_HP
var _dead: bool = false
var _can_fire: bool = true


func _ready() -> void:
	add_to_group("player")
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
	var space := get_world_3d().direct_space_state
	var from := _camera.global_position
	var to := from + (-_camera.global_transform.basis.z) * HITSCAN_RANGE
	var q := PhysicsRayQueryParameters3D.create(from, to)
	q.exclude = [get_rid()]
	q.collision_mask = WORLD_AND_DUMMY
	var hit := space.intersect_ray(q)
	if hit.is_empty():
		return
	var col = hit.get("collider")
	if col and col.has_method("receive_hit"):
		col.receive_hit()


func take_damage(amount: int) -> void:
	if _dead:
		return
	hp = maxi(hp - amount, 0)
	_update_hp()
	if hp <= 0:
		_die()


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
	var gravity: float = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
	if not is_on_floor():
		velocity.y -= gravity * delta

	if _dead:
		velocity.x = 0.0
		velocity.z = 0.0
		move_and_slide()
		return

	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)
	direction.y = 0.0
	if direction.length_squared() > 0.0:
		direction = direction.normalized()
		velocity.x = direction.x * walk_speed
		velocity.z = direction.z * walk_speed
	else:
		velocity.x = 0.0
		velocity.z = 0.0

	move_and_slide()
