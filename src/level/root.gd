extends Node
class_name Root

func _ready():
	SharedRes.manager_request = $ManagerRequest as ManagerRequest
	SharedRes.manager_level = $ManagerLevel as ManagerLevel
	SharedRes.manager_ui = $ManagerUI as ManagerUI
	SharedRes.manager_events = $ManagerEvents as ManagerEvents
	SharedRes.manager_sound = $ManagerSound as ManagerSound
	SharedRes.manager_events.event_goto_main_menu()

func _process(delta):
	var draw_calls = Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME) 
	if draw_calls > 50:
		printerr("ERROR exeeded 50 draw_calls (%s)" % draw_calls)
		get_tree().quit(1)
