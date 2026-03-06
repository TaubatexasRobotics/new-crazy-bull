class_name Player extends CharacterBody2D

const JUMP_VELOCITY : int = -1200
@onready var can_counter : int = 0
@onready var distance : int = 0
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
var jumping : bool = false

func _process(_delta: float) -> void:
	distance += 1

func _physics_process(delta: float) -> void:	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = lerp(0, JUMP_VELOCITY, 0.5)
		
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

func add_to_can_counter() -> void:
	can_counter += 1
