extends Node3D

const SPAWN_LIFT := 0.05

@onready var _player: CharacterBody3D = $Player
@onready var _dummy: StaticBody3D = $Dummy
@onready var _spawn: MeshInstance3D = $SpawnMarker


func _ready() -> void:
	_player.died.connect(_on_player_died)
	_player.respawn_at(_spawn_origin())


func _spawn_origin() -> Vector3:
	var p := _spawn.global_position
	p.y = SPAWN_LIFT
	return p


func _on_player_died() -> void:
	await get_tree().create_timer(1.0).timeout
	_player.respawn_at(_spawn_origin())
	_dummy.reset()
