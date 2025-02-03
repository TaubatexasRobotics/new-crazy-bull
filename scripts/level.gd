extends Node

var ground : StaticBody2D
var screen_size : Vector2i
var camera : Camera2D
var speed : float
const MAX_SPEED : int = 25
const START_SPEED : int = 10
var player : CharacterBody2D
var x_adjustment : float

func _ready() -> void:
	ground = $ground
	camera = $Camera2D
	player = $player
	screen_size = get_window().size
	
	x_adjustment = screen_size.x * 1.1
		
	speed = START_SPEED
	player.velocity = Vector2i(0, 0)

func _process(_delta: float) -> void:
	camera.position.x += speed
	player.position.x += speed
	
	if camera.position.x - ground.position.x > x_adjustment:
		ground.position.x = camera.position.x
