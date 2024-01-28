extends Node3D

func _ready():
	GlobalState.prepare_values_for_next_day()
	PublicRequest.generate_request()
