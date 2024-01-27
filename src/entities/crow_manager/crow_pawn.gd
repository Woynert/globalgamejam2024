extends Node3D
var select: Node

func _ready():
	for child in $visual.get_children():
		child.visible = false

func show_random():
	select = $visual.get_children().pick_random()
	select.visible = true
	change_pose()
	
func change_pose():
	select.animation = ["1","2","3"].pick_random()
