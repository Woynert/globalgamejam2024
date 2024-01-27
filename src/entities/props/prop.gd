extends Node3D
class_name Prop

@export var item: TRICKS.VAR
@onready var billiboard: Node3D = $visual/billiboard

"""
func _ready():
	($AreaReach as Area3D).body_entered.connect(_area_body_entered)
	($AreaReach as Area3D).body_exited.connect(_area_body_exited)
	billiboard.visible = false
	
func show_billiboard(body: Node3D):
	if body is Clown:
		billiboard.visible = true

func _area_body_exited(body: Node3D):
	if body is Clown:
		billiboard.visible = false
"""
