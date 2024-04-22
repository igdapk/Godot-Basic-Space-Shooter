extends CharacterBody2D

@export var speed = 400
@export var velocity_tightness = 0.25
@export var rotation_tightness = 0.25
@export var emitter_node:Node2D
@export var score_label:Label
@export var bullets:Node2D
@export var bullet:PackedScene

func _ready() -> void:
	Global.player = self
	Global.score_label = score_label
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"):
		var new_bullet:Node2D = bullet.instantiate() as Node2D
		new_bullet.global_position = emitter_node.global_position
		new_bullet.global_rotation = emitter_node.global_rotation
		bullets.add_child(new_bullet)

func _physics_process(delta) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = lerp(velocity, input_direction * speed, velocity_tightness)
	move_and_slide()
	
	var prev_rotation = rotation
	look_at(get_global_mouse_position())
	rotation = lerp(prev_rotation, rotation, rotation_tightness)

