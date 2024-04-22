extends Node2D

@export var enemies_node:Node2D
@export var spawnPoints:Array[Node2D]
@export var enemies:Array[PackedScene]

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_spawn_timer_timeout() -> void:
	var new_enemy:Node2D = enemies[randi() % enemies.size()].instantiate() as Node2D
	new_enemy.global_position = spawnPoints[randi() % spawnPoints.size()].global_position
	enemies_node.add_child(new_enemy)
