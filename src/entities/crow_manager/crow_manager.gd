extends Node3D
class_name CrowManager

func _ready():
	poblate()

func poblate():
	var amount = GlobalState.day * 10
	var children = get_children().duplicate()
	var selected = []
	
	for i in range(amount):
		var child = children.pick_random()
		children.erase(child)
		selected.append(child)
	
	for child in selected:
		child.show_random()
