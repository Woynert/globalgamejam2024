extends Control
class_name UiWin

enum OPTION {
	MICKY,
	BAR,
	BEACH,
}

const OPTION_IMAGE = {
	OPTION.MICKY: "res://resource_remote/Mickey End.png",
	OPTION.BAR: "res://resource_remote/Final Poledance.png",
	OPTION.BEACH: "res://resource_remote/Good Ending Retirement.png",
}

func _ready():
	$MarginContainer/Button.pressed.connect(_on_return)
	$TextureRect.texture = load(OPTION_IMAGE[[OPTION.MICKY, OPTION.BAR, OPTION.BEACH].pick_random()])

func _on_return():
	SharedRes.get_manager_events().event_goto_main_menu()
