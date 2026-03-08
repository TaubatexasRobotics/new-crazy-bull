class_name Can extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_to_can_counter()
		queue_free()
