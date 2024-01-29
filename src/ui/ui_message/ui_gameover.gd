extends Control
class_name UiGameOver

enum OPTION {
	TRAIN,
	GAMEOVER,
	POLO,
}

const OPTION_IMAGE = {
	OPTION.TRAIN: "res://resource_remote/Bad ending train tracks.png",
	OPTION.GAMEOVER: "res://resource_remote/Game Over  Screen.png",
	OPTION.POLO: "res://resource_remote/Final Poledance.png",
}

func _ready():
	$MarginContainer/Button.pressed.connect(_on_return)
	var option = [OPTION.TRAIN, OPTION.GAMEOVER, OPTION.POLO].pick_random()
	$TextureRect.texture = load(OPTION_IMAGE[option])
	
	match option:
		OPTION.TRAIN, OPTION.GAMEOVER:
			SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_BAD_ENDING)
		OPTION.POLO:
			SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_BAD_ENDING_POLO)

func _on_return():
	SharedRes.get_manager_events().event_goto_main_menu()
