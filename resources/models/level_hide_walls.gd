@tool
extends Node3D

func _ready():
	get_node("boundaries").visible = false
	get_node("floor").visible = false
	pass
