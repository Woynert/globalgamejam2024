extends Node
class_name ManagerEvents

func event_start_game():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	
	SharedRes.get_manager_level().load_level()
	SharedRes.get_manager_level().timer_start()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.GAME)
	
func event_finish_day():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	
	SharedRes.get_manager_level().timer_stop()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.DAY_RESUME)
	

