extends Node3D

func _ready():
	GlobalState.reset()
	PublicRequest.generate_request()
