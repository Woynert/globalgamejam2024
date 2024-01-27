extends Control
class_name UiBar

@export var label_text: String = "test"

func _ready():
	$Label.text = label_text

func set_bar_value(p_value):
	$ProgressBar.value = p_value
