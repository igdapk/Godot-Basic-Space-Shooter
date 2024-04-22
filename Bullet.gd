extends Area2D

@export var speed = 1200

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		Global.incrementScore()
		body.queue_free()
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
