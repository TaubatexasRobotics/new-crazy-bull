class_name UI extends CanvasLayer

@export var player : Player = null
@onready var can_counter : Label = $CanCounter
@onready var distance_counter : Label = $DistanceCounter

func update_data() -> void:
	can_counter.text = str(player.can_counter) + "/" + str(player.total_can)
	distance_counter.text = str(player.distance)

func _ready() -> void:
	update_data()	
	
func _process(_delta: float) -> void:
	update_data()
