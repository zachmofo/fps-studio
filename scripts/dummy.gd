extends CharacterBody3D

signal killed

const MAX_HP := 3
const FIRE_INTERVAL := 1.0
const WORLD_AND_PLAYER := 1 | 2
const BASE_COLOR := Color(0.72, 0.22, 0.18)
const HEAD_COLOR := Color(0.12, 0.10, 0.10)
const FLASH_COLOR := Color(1, 1, 1)
const FLASH_SEC := 0.22
const WALK_SPEED := 2.4
const PATROL_X := 6.0
const OUT_SEC := 2.0
const IN_SEC := 1.5
const PEEK_PAST := 0.7
const BOX_HALF_X := 0.7
const BOX_HALF_Z := 0.35
const CAPSULE_R := 0.4
const ARRIVE_EPS := 0.15

enum Phase { PATROL, OUT, IN }

var hp: int = MAX_HP
var _alive: bool = true
var _acc: float = 0.0
var _was_captured: bool = false
var _home: Vector3 = Vector3.ZERO
var _dir: float = 1.0
var _gravity: float = 9.8
var _phase: int = Phase.PATROL
var _phase_t: float = 0.0
var _hide: Vector3 = Vector3.ZERO
var _peek: Vector3 = Vector3.ZERO

@onready var _mesh: MeshInstance3D = $MeshInstance3D
@onready var _head: MeshInstance3D = $Head
@onready var _col: CollisionShape3D = $CollisionShape3D


func _ready() -> void:
	add_to_group("dummy")
	_home = global_position
	_gravity = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
	_bind_cover()
	_mesh.set_surface_override_material(0, null)
	_head.set_surface_override_material(0, null)
	_set_mesh_albedo(_mesh, BASE_COLOR)
	_set_mesh_albedo(_head, HEAD_COLOR)


func _bind_cover() -> void:
	var parent: Node = get_parent()
	var box: Node3D = null
	if parent != null:
		box = parent.get_node_or_null("CoverMid") as Node3D
	if box == null:
		_hide = _home
		_peek = _home
		return
	var p: Vector3 = box.global_position
	p.y = _home.y
	# Right-side tuck on the dummy-side (-Z). Left mid is player-only.
	_hide = Vector3(p.x + 0.5, p.y, p.z - BOX_HALF_Z - CAPSULE_R - 0.1)
	_peek = Vector3(p.x - BOX_HALF_X - PEEK_PAST, p.y, _hide.z)


func receive_hit() -> void:
	if not _alive:
		return
	hp -= 1
	_flash()
	if hp <= 0:
		_die()


func _die() -> void:
	_alive = false
	velocity = Vector3.ZERO
	_mesh.visible = false
	_head.visible = false
	_col.disabled = true
	killed.emit()


func reset() -> void:
	hp = MAX_HP
	_alive = true
	_acc = 0.0
	_dir = 1.0
	_phase_t = 0.0
	_was_captured = Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	global_position = _home
	velocity = Vector3.ZERO
	_mesh.visible = true
	_head.visible = true
	_col.disabled = false
	_set_mesh_albedo(_mesh, BASE_COLOR)
	_set_mesh_albedo(_head, HEAD_COLOR)
	if _was_captured:
		_phase = Phase.OUT
	else:
		_phase = Phase.PATROL


func _physics_process(delta: float) -> void:
	if not _alive:
		return
	if not is_on_floor():
		velocity.y -= _gravity * delta

	var captured: bool = Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if captured and not _was_captured:
		_acc = 0.0
		_phase_t = 0.0
		if _phase == Phase.PATROL:
			_phase = Phase.OUT
	_was_captured = captured

	if not captured:
		if _phase == Phase.PATROL:
			_patrol()
		else:
			velocity.x = 0.0
			velocity.z = 0.0
		move_and_slide()
		return

	if _phase == Phase.PATROL:
		_phase = Phase.OUT
		_phase_t = 0.0

	if _phase == Phase.OUT:
		_walk_toward(_peek)
		_phase_t += delta
		_acc += delta
		if _acc >= FIRE_INTERVAL:
			_acc = 0.0
			_return_fire()
		if _phase_t >= OUT_SEC:
			_phase = Phase.IN
			_phase_t = 0.0
			_acc = 0.0
	else:
		_walk_toward(_hide)
		_phase_t += delta
		if _phase_t >= IN_SEC:
			_phase = Phase.OUT
			_phase_t = 0.0
			_acc = 0.0

	move_and_slide()


func _patrol() -> void:
	if global_position.x > PATROL_X:
		_dir = -1.0
	elif global_position.x < -PATROL_X:
		_dir = 1.0
	velocity.x = _dir * WALK_SPEED
	velocity.z = 0.0


func _walk_toward(target: Vector3) -> void:
	var to: Vector3 = target - global_position
	to.y = 0.0
	if to.length() <= ARRIVE_EPS:
		velocity.x = 0.0
		velocity.z = 0.0
		return
	var dir: Vector3 = to.normalized()
	velocity.x = dir.x * WALK_SPEED
	velocity.z = dir.z * WALK_SPEED


func _return_fire() -> void:
	var players: Array = get_tree().get_nodes_in_group("player")
	if players.is_empty():
		return
	var body: Node3D = players[0] as Node3D
	if body == null:
		return
	if not body.has_method("is_alive") or not body.is_alive():
		return
	var from: Vector3 = global_position + Vector3(0.0, 1.4, 0.0)
	var target: Vector3 = body.global_position + Vector3(0.0, 1.6, 0.0)
	var space: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
	var q: PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(from, target)
	q.exclude = [get_rid()]
	q.collision_mask = WORLD_AND_PLAYER
	var hit: Dictionary = space.intersect_ray(q)
	if hit.is_empty():
		return
	var col: Object = hit.get("collider") as Object
	if col == body and body.has_method("take_damage"):
		body.take_damage(1)


func _flash() -> void:
	_set_mesh_albedo(_mesh, FLASH_COLOR)
	_set_mesh_albedo(_head, FLASH_COLOR)
	await get_tree().create_timer(FLASH_SEC).timeout
	if _alive:
		_set_mesh_albedo(_mesh, BASE_COLOR)
		_set_mesh_albedo(_head, HEAD_COLOR)


func _set_mesh_albedo(mesh_inst: MeshInstance3D, c: Color) -> void:
	if mesh_inst == null:
		return
	mesh_inst.set_surface_override_material(0, null)
	var prim: PrimitiveMesh = mesh_inst.mesh as PrimitiveMesh
	if prim == null:
		return
	var mat: StandardMaterial3D = prim.material as StandardMaterial3D
	if mat == null:
		mat = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		prim.material = mat
	mat.albedo_color = c
