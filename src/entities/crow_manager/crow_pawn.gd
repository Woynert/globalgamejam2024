extends Node3D

func _ready():
	for child in $visual.get_children():
		child.visible = false

func show_random():
	var select = $visual.get_children().pick_random()
	select.visible = true
	select.animation = ["1","2","3"].pick_random()
