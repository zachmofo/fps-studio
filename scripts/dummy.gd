extends StaticBody3D

const MAX_HP := 3
const FIRE_INTERVAL := 1.0
const WORLD_AND_PLAYER := 1 | 2
const BASE_COLOR := Color(0.72, 0.22, 0.18)

var hp: int = MAX_HP
var _alive: bool = true
var _acc: float = 0.0

@onready var _mesh: MeshInstance3D = $MeshInstance3D
@onready var _col: CollisionShape3D = $CollisionShape3D


func _ready() -> void:
	add_to_group("dummy")
	_ensure_mat(BASE_COLOR)


func receive_hit() -> void:
	if not _alive:
		return
	hp -= 1
	_flash()
	if hp <= 0:
		_die()


func _die() -> void:
	_alive = false
	_mesh.visible = false
	_col.disabled = true


func reset() -> void:
	hp = MAX_HP
	_alive = true
	_acc = 0.0
	_mesh.visible = true
	_col.disabled = false
	_set_albedo(BASE_COLOR)


func _physics_process(delta: float) -> void:
	if not _alive:
		return
	_acc += delta
	if _acc >= FIRE_INTERVAL:
		_acc = 0.0
		_return_fire()


func _return_fire() -> void:
	var players: Array = get_tree().get_nodes_in_group("player")
	if players.is_empty():
		return
	var body := players[0] as Node3D
	if body == null:
		return
	if not body.has_method("is_alive") or not body.is_alive():
		return
	var from: Vector3 = global_position + Vector3(0.0, 1.4, 0.0)
	var target: Vector3 = body.global_position + Vector3(0.0, 1.6, 0.0)
	var space := get_world_3d().direct_space_state
	var q := PhysicsRayQueryParameters3D.create(from, target)
	q.exclude = [get_rid()]
	q.collision_mask = WORLD_AND_PLAYER
	var hit := space.intersect_ray(q)
	if hit.is_empty():
		return
	if hit.get("collider") == body and body.has_method("take_damage"):
		body.take_damage(1)


func _flash() -> void:
	_set_albedo(Color(1, 1, 1))
	await get_tree().create_timer(0.08).timeout
	if _alive:
		_set_albedo(BASE_COLOR)


func _ensure_mat(c: Color) -> void:
	var mat := _mesh.get_surface_override_material(0)
	if mat == null:
		mat = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		_mesh.set_surface_override_material(0, mat)
	mat.albedo_color = c


func _set_albedo(c: Color) -> void:
	_ensure_mat(c)
