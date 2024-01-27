extends Node3D

func _ready():
	GlobalState.reset()
	
	SharedRes.manager_request = $ManagerRequest as ManagerRequest
