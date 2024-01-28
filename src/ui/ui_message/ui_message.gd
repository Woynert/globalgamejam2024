extends Control

var callback

func _ready():
	$Control/VBoxContainer/HBoxContainer/Button.pressed.connect(_on_button_next)

func _on_button_next():
	if callback:
		callback.call()

func setup(message: String, p_callback):
	$Control/VBoxContainer/Label.text = message
	callback = p_callback
