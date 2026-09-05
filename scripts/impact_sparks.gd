## I-16: short-lived unshaded spit at hit points (Compatibility-safe).
class_name ImpactSparks
extends RefCounted

const SPREAD := 0.15
const WORLD_A := Color(1.0, 0.75, 0.25, 1.0)
const WORLD_B := Color(0.6, 0.35, 0.1, 0.0)
const CRATE_FLECK := Color(0.25, 0.25, 0.22, 1.0)
const DUMMY_A := Color(1.0, 0.55, 0.12, 1.0)
const DUMMY_B := Color(0.55, 0.25, 0.05, 0.0)


static func spawn_world(host: Node, at: Vector3, crate: bool = false) -> void:
	if host == null or not is_instance_valid(host):
		return
	var count: int = randi_range(4, 8)
	for _i in count:
		_spit(
			host,
			at,
			WORLD_A,
			WORLD_B,
			randf_range(0.12, 0.18),
			randf_range(0.025, 0.045)
		)
	if crate:
		_spit(host, at, CRATE_FLECK, Color(CRATE_FLECK.r, CRATE_FLECK.g, CRATE_FLECK.b, 0.0), randf_range(0.12, 0.18), 0.05)


static func spawn_dummy(host: Node, at: Vector3, kill: bool = false) -> void:
	if host == null or not is_instance_valid(host):
		return
	var count: int = randi_range(3, 5)
	var radius: float = 0.035
	if kill:
		count += 2
		radius = 0.055
	for _i in count:
		_spit(
			host,
			at,
			DUMMY_A,
			DUMMY_B,
			randf_range(0.10, 0.15),
			radius * randf_range(0.75, 1.15)
		)


static func _spit(host: Node, at: Vector3, c0: Color, c1: Color, life: float, radius: float) -> void:
	var tree: SceneTree = host.get_tree()
	if tree == null:
		return
	var parent: Node = tree.current_scene
	if parent == null:
		parent = host
	var mi: MeshInstance3D = MeshInstance3D.new()
	var sphere: SphereMesh = SphereMesh.new()
	sphere.radius = radius
	sphere.height = radius * 2.0
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color = c0
	sphere.material = mat
	mi.mesh = sphere
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(mi)
	mi.global_position = at + Vector3(
		randf_range(-SPREAD, SPREAD),
		randf_range(-SPREAD * 0.6, SPREAD * 0.6),
		randf_range(-SPREAD, SPREAD)
	)
	var tw: Tween = mi.create_tween()
	tw.tween_property(mat, "albedo_color", c1, life)
	tw.tween_callback(mi.queue_free)
