extends Control

func _ready():
	$BtnPlay.pressed.connect(_on_btn_start)
	$BtnQuit.pressed.connect(_on_btn_quit)
	
func _on_btn_start():
	SharedRes.get_manager_events().event_start_game()
	
func _on_btn_quit():
	get_tree().quit()
