extends Control
class_name UiGameOver

enum OPTION {
	TRAIN,
	GAMEOVER,
}

const OPTION_IMAGE = {
	OPTION.TRAIN: "res://resource_remote/Bad ending train tracks.png",
	OPTION.GAMEOVER: "res://resource_remote/Game Over  Screen.png",
}

func _ready():
	$MarginContainer/Button.pressed.connect(_on_return)
	$TextureRect.texture = load(OPTION_IMAGE[[OPTION.TRAIN, OPTION.GAMEOVER].pick_random()])

func _on_return():
	SharedRes.get_manager_events().event_goto_main_menu()
