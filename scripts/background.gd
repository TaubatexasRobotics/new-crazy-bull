class_name Background extends Node2D

@export var background: Node2D = null
@export var foreground: Node2D = null
@export var speed: int = 5

const MIN_LIMIT: int = -6
const MAX_LIMIT: int = 1158.0

func update_background() -> void:
	background.position.x -= (speed / 2)
	foreground.position.x -= speed
	
	if foreground.position.x <= MIN_LIMIT:
		foreground.position.x = MAX_LIMIT
	
	if background.position.x <= MIN_LIMIT:
		background.position.x = MAX_LIMIT

func _process(_delta: float) -> void:
	update_background()
