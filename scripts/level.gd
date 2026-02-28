class_name Level extends Node

@onready var camera : Camera2D = $Camera2D
@onready var player : CharacterBody2D = $player
@export var static_objects : Array[PackedScene] = []
@export var heights : Array[int] = []
@onready var spawner : Marker2D = $Spawner
@onready var static_bodies : Node = $StaticBodies
@onready var delete_bodies : Area2D = $DeleteBodies
var speed : float = 0
var current_ground : ScrollBody
var current_ground_index: int = 0

func _ready() -> void:
	var ground_reference: ScrollBody = static_bodies.get_children()[0]
	current_ground = ground_reference
	speed = current_ground.speed
	current_ground_index = 0

func update_speed(amount: int) -> void:
	var bodies = static_bodies.get_children()
	for body in bodies:
		body.increase_speed(amount)
	speed = bodies[0].speed

func _process(_delta) -> void:
	if current_ground.global_position.x < 0:
		var randindex: int = current_ground_index
		while randindex == current_ground_index:
			randindex = randi_range(0, len(static_objects) - 1)
		current_ground = spawn(static_objects[randindex], static_bodies)
		current_ground.speed = speed
		current_ground_index = randindex

func spawn(element: PackedScene, reference: Node) -> ScrollBody:
	var new_instance: Node2D = element.instantiate()
	new_instance.global_position = spawner.global_position
	var selected_height: int = randi_range(0, len(heights) - 1)
	new_instance.global_position.y -= heights[selected_height]
	reference.add_child(new_instance)
	return new_instance

func _on_timer_timeout() -> void:
	update_speed(1)

func _on_delete_bodies_area_entered(area: Area2D) -> void:
	area.get_parent().queue_free()
