extends Node
class_name DebugKeys

func _physics_process(delta):
	
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("debug_1"):
		SharedRes.get_manager_level().unload_level()
		SharedRes.get_manager_level().load_level()
		SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.GAME)
		
	if Input.is_action_just_pressed("debug_2"):
		SharedRes.get_manager_level().unload_level()
		SharedRes.get_manager_level().load_level()
		SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.GAME)
