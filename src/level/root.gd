extends Node3D

func _ready():
	SharedRes.manager_request = $ManagerRequest as ManagerRequest
