extends CharacterBody2D

const SPEED : int = 4200
const JUMP_VELOCITY : int = -600
var sprite : AnimatedSprite2D

func _ready() -> void:
	sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
		sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
	move_and_slide()
