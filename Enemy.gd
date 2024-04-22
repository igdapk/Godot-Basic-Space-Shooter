extends CharacterBody2D

@export var speed = 200

func _ready() -> void:
	look_at(Global.player.global_position)

func _process(delta: float) -> void:
	var velocity:Vector2 = transform.x * delta * speed
	var collision = move_and_collide(velocity)
	if collision and collision.get_collider().name == "Player":
		Global.reset()
		get_tree().reload_current_scene()

func _on_timer_timeout() -> void:
	queue_free()
