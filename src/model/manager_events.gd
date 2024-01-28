extends Node
class_name ManagerEvents

func event_goto_main_menu():
	SharedRes.manager_ui.unload_all()
	SharedRes.manager_ui.show_menu(ManagerUI.MENU.MAIN)
	SharedRes.manager_sound.play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_TROMPETA)

func event_start_game():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	SharedRes.get_manager_request().stop()
	
	GlobalState.day = 1
	SharedRes.get_manager_level().load_level()
	SharedRes.get_manager_level().timer_start()
	SharedRes.get_manager_request().start()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.GAME)
	SharedRes.get_manager_sound().play_stream(ManagerSound.AUDIO.APLAUSO_GRUPAL)
	SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_INTRO)
	
func event_finish_day():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	SharedRes.get_manager_request().stop()
	
	SharedRes.get_manager_level().timer_stop()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.DAY_RESUME)

func event_next_level():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	SharedRes.get_manager_request().stop()
	
	GlobalState.day += 1
	print(GlobalState.day)
	SharedRes.get_manager_level().load_level()
	SharedRes.get_manager_level().timer_start()
	SharedRes.get_manager_request().start()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.GAME)
	
	

