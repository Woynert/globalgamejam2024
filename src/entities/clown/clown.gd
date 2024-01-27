extends CharacterBody3D
class_name Clown

@onready var node_monocycle = $Monocycle
@onready var node_walk_controller = $WalkController

func _physics_process(delta):
	if node_monocycle.enabled:
		node_monocycle.move(self, delta)
	else:
		node_walk_controller.move(self, delta)
	move_and_slide()
