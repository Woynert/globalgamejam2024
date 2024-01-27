extends Node

func _physics_process(delta):
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene()
