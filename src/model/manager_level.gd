extends Node3D
class_name ManagerLevel

@onready var level_scene = preload("res://src/level/level_pilot.tscn")
@export var level_root_node: Node3D = self

func unload_level ():
	var children = level_root_node.get_children()
	for child in children:
		child.queue_free()

func load_level ():
	var level = level_scene.instantiate()
	level_root_node.add_child(level)
