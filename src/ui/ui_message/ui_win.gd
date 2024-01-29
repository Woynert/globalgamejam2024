extends Control
class_name UiWin

enum OPTION {
	MICKY,
	BEACH,
}

const OPTION_IMAGE = {
	OPTION.MICKY: "res://resource_remote/Mickey End.png",
	OPTION.BEACH: "res://resource_remote/Good Ending Retirement.png",
}

func _ready():
	$MarginContainer/Button.pressed.connect(_on_return)
	var option = [OPTION.MICKY, OPTION.BEACH].pick_random()
	$TextureRect.texture = load(OPTION_IMAGE[option])
	
	SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_GOOD_ENDING)

func _on_return():
	SharedRes.get_manager_events().event_goto_main_menu()
