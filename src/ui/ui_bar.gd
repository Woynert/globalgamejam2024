extends Control
class_name UiBar

@export var image: Texture = null
@export var use_bar: bool = true

func _ready():
	$TextureRect.texture = image
	if !use_bar:
		$Label.visible = true
		$ProgressBar.visible = false

func set_value(p_value):
	if use_bar:
		$ProgressBar.value = p_value
	else:
		$Label.text = str(p_value)

