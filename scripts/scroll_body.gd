class_name ScrollBody extends StaticBody2D

@export var speed : int = 3

func _physics_process(_delta: float) -> void:
	position.x -= speed

func update_speed(new_speed: int) -> void:
	speed = new_speed

func increase_speed(amount: int) -> void:
	speed += amount
