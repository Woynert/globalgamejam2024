extends Node
class_name Root

func _ready():
	SharedRes.manager_request = $ManagerRequest as ManagerRequest
	SharedRes.manager_level = $ManagerLevel as ManagerLevel
	SharedRes.manager_ui = $ManagerUI as ManagerUI
	SharedRes.manager_events = $ManagerEvents as ManagerEvents
