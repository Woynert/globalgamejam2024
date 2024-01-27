extends AnimatableBody3D
class_name Elevator

@export var node_limit: Node3D = null
@export var speed: float = 10
var starting_height = 0
var enabled = false
var up = true

func _ready():
	starting_height = global_position.y
	($AreaActivate as Area3D).body_entered.connect(_on_body_entered)
	($AreaActivate as Area3D).body_exited.connect(_on_body_exited)
	
func _physics_process(delta):
	if !enabled:
		return
	if up:
		global_position.y += speed * delta
		if global_position.y > node_limit.global_position.y:
			global_position.y = node_limit.global_position.y
			enabled = false
	else:
		global_position.y -= speed * delta
		if global_position.y < starting_height:
			global_position.y = starting_height
			enabled = false
	
func _on_body_entered(body):
	if body is Clown:
		enabled = true
		up = true
	
func _on_body_exited(body):
	if body is Clown:
		enabled = true
		up = false
