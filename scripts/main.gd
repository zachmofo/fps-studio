extends Node3D

const SPAWN_LIFT := 0.05

@onready var _player: CharacterBody3D = $Player
@onready var _dummy: CharacterBody3D = $Dummy
@onready var _spawn: MeshInstance3D = $SpawnMarker


func _ready() -> void:
	_player.died.connect(_on_player_died)
	_player.global_position = _spawn_origin()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _spawn_origin() -> Vector3:
	var p := _spawn.global_position
	p.y = SPAWN_LIFT
	return p


func _on_player_died() -> void:
	await get_tree().create_timer(1.0).timeout
	_player.respawn_at(_spawn_origin(), true)
	if _dummy.has_method("reset"):
		_dummy.reset()
