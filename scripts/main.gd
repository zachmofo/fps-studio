extends Node3D

const SPAWN_LIFT := 0.05
const CLEAR_HOLD := 3.0

@onready var _player: CharacterBody3D = $Player
@onready var _dummy: CharacterBody3D = $Dummy
@onready var _spawn: MeshInstance3D = $SpawnMarker

var _wave: int = 0


func _ready() -> void:
	_player.died.connect(_on_player_died)
	if _dummy.has_signal("killed"):
		_dummy.killed.connect(_on_dummy_killed)
	_player.global_position = _spawn_origin()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _spawn_origin() -> Vector3:
	var p: Vector3 = _spawn.global_position
	p.y = SPAWN_LIFT
	return p


func _on_dummy_killed() -> void:
	var wave: int = _wave
	if _player.has_method("set_objective_cleared"):
		_player.set_objective_cleared(true)
	await get_tree().create_timer(CLEAR_HOLD).timeout
	if wave != _wave:
		return
	if _dummy.has_method("reset"):
		_dummy.reset()
	if _player.has_method("set_objective_cleared"):
		_player.set_objective_cleared(false)


func _on_player_died() -> void:
	_wave += 1
	await get_tree().create_timer(1.0).timeout
	_player.respawn_at(_spawn_origin(), true)
	if _dummy.has_method("reset"):
		_dummy.reset()
	if _player.has_method("set_objective_cleared"):
		_player.set_objective_cleared(false)
