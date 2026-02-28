class_name Player extends CharacterBody2D

const JUMP_VELOCITY : int = -600
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
var jumping : bool = false

func _physics_process(delta: float) -> void:	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
		
		sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump")
			if Input.is_action_just_released("ui_accept"):
				velocity.y = 0
		else:
			sprite.play("fall")
		
		velocity += get_gravity() * delta

	move_and_slide()
