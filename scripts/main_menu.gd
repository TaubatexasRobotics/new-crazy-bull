class_name MainMenu extends CanvasLayer

@onready var transition : Transition = $Transition

func _on_play_pressed() -> void:
	transition.fade_in("level")
