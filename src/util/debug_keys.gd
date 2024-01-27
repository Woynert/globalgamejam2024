extends Node
class_name DebugKeys

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
	
	# start from level 1
	if Input.is_action_just_pressed("debug_1"):
		SharedRes.get_manager_events().event_start_game()
		
	elif Input.is_action_just_pressed("debug_2"):
		SharedRes.get_manager_events().event_finish_day()
		
	elif Input.is_action_just_pressed("debug_3"):
		#SharedRes.get_manager_level().unload_level()
		#SharedRes.get_manager_ui().unload_all()
		#SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.DAY_RESUME)
		pass

