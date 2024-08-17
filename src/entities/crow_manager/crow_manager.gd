extends Node3D
class_name CrowManager

var selected: Array[Node] = []

func _ready():
	poblate()
	$TimerUpdatePawns.timeout.connect(update_pawns)
	$TimerUpdatePawns.start()

func poblate():
	var children = $pawns.get_children().duplicate()
	var amount = min(20, children.size())
	selected = []
	
	for i in range(amount):
		var child = children.pick_random()
		children.erase(child)
		selected.append(child)
	
	for child in selected:
		child.show_random()
		
func update_pawns():
	var amount = int(selected.size() / 3)
	for i in range(amount):
		var child = selected.pick_random()
		child.change_pose() 
