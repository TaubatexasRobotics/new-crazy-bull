class_name Quiz extends CanvasLayer

@export var questions_file_path: String = "res://assets/questions.json"
@onready var ref_question : int = 0
@onready var questions : Dictionary = {}
@onready var option_a : Button = $option_a
@onready var option_b : Button = $option_b
@onready var option_c : Button = $option_c
@onready var option_d : Button = $option_d
@onready var question_description : Label = $question_description
@onready var transition : Transition = $Transition

func load_dialogue_data():
	var file = FileAccess.open(questions_file_path, FileAccess.READ)
	if file.is_open():
		var json_string = file.get_as_text()
		file.close()
		var json = JSON.new()
		var error = json.parse(json_string)
		if error == OK:
			questions = json.data
		else:
			push_error("JSON Parse Error: ", json.get_error_message(), " at line ", json.get_error_line())
	else:
		push_error("Failed to open dialogue file.")
	
	ref_question = randi_range(0, len(['data'][ref_question]) - 1)
	
	if len(questions['data']) > 0:
		question_description.text = questions['data'][ref_question]['question']
		option_a.text = "A. " + questions['data'][ref_question]['options']['A']
		option_b.text = "B. " + questions['data'][ref_question]['options']['B']
		option_c.text = "C. " + questions['data'][ref_question]['options']['C']
		option_d.text = "D. " + questions['data'][ref_question]['options']['D']

func _ready() -> void:
	load_dialogue_data()

func _on_option_a_pressed() -> void:
	var selected_option : String = "A"
	if selected_option == questions['data'][ref_question]['correct_answer']:
		transition.fade_in("level")
	else:
		transition.fade_in("game_over")

func _on_option_b_pressed() -> void:
	var selected_option : String = "B"
	if selected_option == questions['data'][ref_question]['correct_answer']:
		transition.fade_in("level")
	else:
		transition.fade_in("game_over")

func _on_option_c_pressed() -> void:
	var selected_option : String = "C"
	if selected_option == questions['data'][ref_question]['correct_answer']:
		transition.fade_in("level")
	else:
		transition.fade_in("game_over")

func _on_option_d_pressed() -> void:
	var selected_option : String = "D"
	if selected_option == questions['data'][ref_question]['correct_answer']:
		transition.fade_in("level")
	else:
		transition.fade_in("game_over")
