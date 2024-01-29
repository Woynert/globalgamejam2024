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
	GlobalState.savings = GlobalState.savings_initial_value
	
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
	
	for i in range(2):
		await(get_tree().physics_frame)
		
	GlobalState.prev_savings = GlobalState.savings
	GlobalState.savings += GlobalState.day_profit

	SharedRes.get_manager_level().timer_stop()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.DAY_RESUME)
	SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_TIBURONES)

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
	
func event_gameover():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	SharedRes.get_manager_request().stop()
	
	for i in range(2):
		await(get_tree().physics_frame)
	
	SharedRes.get_manager_sound().stop_loop()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.MESSAGE)
	var menu = SharedRes.get_manager_ui().get_current_menu()
	var lambda = func():
		SharedRes.get_manager_ui().unload_all()
		SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.GAMEOVER)
		
	menu.setup("You couldn't pay your rent", lambda)

func event_win():
	SharedRes.get_manager_level().unload_level()
	SharedRes.get_manager_ui().unload_all()
	SharedRes.get_manager_request().stop()
	
	for i in range(2):
		await(get_tree().physics_frame)
	
	SharedRes.get_manager_sound().stop_loop()
	SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.MESSAGE)
	var menu = SharedRes.get_manager_ui().get_current_menu()
	var lambda = func():
		SharedRes.get_manager_ui().unload_all()
		SharedRes.get_manager_ui().show_menu(ManagerUI.MENU.WIN)
		
	menu.setup("Congratulations! You did it!", lambda)

