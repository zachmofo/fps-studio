extends CharacterBody3D

## First-person walk-and-look controller (I-0). No jump, sprint, or shoot.

## Mouse look sensitivity in radians per pixel. Raw relative motion; no smoothing or accel.
@export var mouse_sensitivity: float = 0.0025
## Walk speed in meters per second.
@export var walk_speed: float = 5.0

@onready var _camera: Camera3D = $Camera3D

const PITCH_LIMIT := deg_to_rad(89.0)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		return

	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		return

	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		_camera.rotation.x = clampf(
			_camera.rotation.x - event.relative.y * mouse_sensitivity,
			-PITCH_LIMIT,
			PITCH_LIMIT
		)


func _physics_process(delta: float) -> void:
	var gravity: float = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
	if not is_on_floor():
		velocity.y -= gravity * delta

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
