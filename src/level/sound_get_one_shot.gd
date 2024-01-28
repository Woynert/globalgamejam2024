extends Node
var last_index = 0

func get_player() -> AudioStreamPlayer:
	var children = get_children()
	last_index += 1
	if last_index >= children.size():
		last_index = 0
	return children[last_index]
