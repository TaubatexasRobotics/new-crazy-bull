class_name ScrollBody extends StaticBody2D

var max_speed: int  = 10
@export var speed : int = 3
@onready var item_spawners : Node2D = $ItemSpawners
@onready var can : PackedScene = preload("res://scenes/can.tscn")

func _ready() -> void:
	var markers = item_spawners.get_children()
	if len(markers) > 0:
		var randindex = randi_range(0, len(markers) - 1)
		var instance = can.instantiate()
		instance.position = markers[randindex].position
		add_child(instance)
		print(instance)

func _physics_process(_delta: float) -> void:
	position.x -= speed

func update_speed(new_speed: int) -> void:
	speed = new_speed

func increase_speed(amount: int) -> void:
	if speed < max_speed:
		speed += amount
