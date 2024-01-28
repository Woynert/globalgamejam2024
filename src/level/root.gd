extends Node
class_name Root

func _ready():
	SharedRes.manager_request = $ManagerRequest as ManagerRequest
	SharedRes.manager_level = $ManagerLevel as ManagerLevel
	SharedRes.manager_ui = $ManagerUI as ManagerUI
	SharedRes.manager_events = $ManagerEvents as ManagerEvents
	SharedRes.manager_sound = $ManagerSound as ManagerSound
	SharedRes.manager_ui.unload_all()
	SharedRes.manager_ui.show_menu(ManagerUI.MENU.MAIN)
	SharedRes.manager_sound.play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_TROMPETA)
