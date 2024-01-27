extends CharacterBody3D
class_name Clown

@onready var node_walk_controller = $WalkController
@onready var node_monocycle = $Monocycle
@onready var node_rope = $Rope

func _physics_process(delta):
	if node_monocycle.enabled:
		node_monocycle.move(delta)
	else:
		node_walk_controller.move(delta, !node_rope.enabled)
	if node_rope.enabled:
		node_rope.move(delta)
	move_and_slide()
	
func is_on_floor_shapecast() -> bool:
	return ($ShapeCast3D as ShapeCast3D).is_colliding()
