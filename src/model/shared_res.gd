extends Node
# autoloaded as SharedRes

var manager_request: ManagerRequest
var manager_level: ManagerLevel
var manager_ui: ManagerUI
var manager_events: ManagerEvents
var manager_sound: ManagerSound

func get_manager_request() -> ManagerRequest:
	return manager_request as ManagerRequest
func get_manager_level() -> ManagerLevel:
	return manager_level
func get_manager_ui() -> ManagerUI:
	return manager_ui
func get_manager_events() -> ManagerEvents:
	return manager_events
func get_manager_sound() -> ManagerSound:
	return manager_sound
