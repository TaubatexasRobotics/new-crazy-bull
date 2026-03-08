class_name Transition extends CanvasLayer

@onready var animation : AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	visible = true
	animation.play("open")

func fade_in(target: String) -> void:
	animation.play_backwards("open")
	await animation.animation_finished
	get_tree().change_scene_to_file("res://scenes/" + target + ".tscn")

func play_fade_in() -> void:
	animation.play("open")

func play_fade_out() -> void:
	animation.play_backwards("open")
