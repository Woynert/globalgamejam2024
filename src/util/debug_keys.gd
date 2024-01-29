extends Node
class_name DebugKeys

func _physics_process(delta):
	if !Input.is_action_pressed("debug_switch"):
		return
		
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("debug_1"):
		SharedRes.get_manager_events().event_start_game()
		
	elif Input.is_action_just_pressed("debug_2"):
		SharedRes.get_manager_events().event_finish_day()
		Input.action_release("debug_2")
		
	elif Input.is_action_just_pressed("debug_3"):
		SharedRes.get_manager_events().event_gameover()
		
	elif Input.is_action_just_pressed("debug_4"):
		SharedRes.get_manager_events().event_win()

