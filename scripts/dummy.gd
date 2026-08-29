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

var hp: int = MAX_HP
var _alive: bool = true
var _acc: float = 0.0
var _was_captured: bool = false
var _home: Vector3 = Vector3.ZERO
var _dir: float = 1.0
var _gravity: float = 9.8

@onready var _mesh: MeshInstance3D = $MeshInstance3D
@onready var _head: MeshInstance3D = $Head
@onready var _col: CollisionShape3D = $CollisionShape3D


func _ready() -> void:
	add_to_group("dummy")
	_home = global_position
	_gravity = float(ProjectSettings.get_setting("physics/3d/default_gravity"))
	_mesh.set_surface_override_material(0, null)
	_head.set_surface_override_material(0, null)
	_set_mesh_albedo(_mesh, BASE_COLOR)
	_set_mesh_albedo(_head, HEAD_COLOR)


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
	_was_captured = Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	global_position = _home
	velocity = Vector3.ZERO
	_mesh.visible = true
	_head.visible = true
	_col.disabled = false
	_set_mesh_albedo(_mesh, BASE_COLOR)
	_set_mesh_albedo(_head, HEAD_COLOR)


func _physics_process(delta: float) -> void:
	if not _alive:
		return
	if not is_on_floor():
		velocity.y -= _gravity * delta
	if global_position.x > PATROL_X:
		_dir = -1.0
	elif global_position.x < -PATROL_X:
		_dir = 1.0
	velocity.x = _dir * WALK_SPEED
	velocity.z = 0.0
	move_and_slide()

	var captured: bool = Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if captured and not _was_captured:
		_acc = 0.0
	_was_captured = captured
	if not captured:
		return
	_acc += delta
	if _acc >= FIRE_INTERVAL:
		_acc = 0.0
		_return_fire()


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
