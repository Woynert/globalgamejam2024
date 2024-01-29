extends Control

func _ready():
	$BtnContainer/BtnPlay.pressed.connect(_on_btn_start)
	$BtnContainer/BtnCredits.pressed.connect(_on_btn_credits)
	$BtnContainer/BtnQuit.pressed.connect(_on_btn_quit)
	
func _on_btn_start():
	SharedRes.get_manager_events().event_start_game()
	
func _on_btn_credits():
	# SharedRes.get_manager_ui().unload_all()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.CREDITS)
	self.queue_free()

func _on_btn_quit():
	get_tree().quit()
