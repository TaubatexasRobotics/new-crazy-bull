class_name GameOver extends CanvasLayer

@onready var transition : Transition = $Transition

func _on_yes_pressed() -> void:
	transition.fade_in("level")

func _on_no_pressed() -> void:
		transition.fade_in("main_menu")
