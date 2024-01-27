extends Node3D

var enabled: bool = false
var node_rope: Rope = null
var previous_pos_in_rope: float = 0
var pos_in_rope_changed: bool = false

const JUMP_VELOCITY = 8.5
const SPEED_CAP = 2.0

func _ready():
	$TimerRope.timeout.connect(_timer_rope_timeout)
	$TimerRope.start()
	
func _timer_rope_timeout():
	var manager_request = SharedRes.manager_request as ManagerRequest
	if enabled && pos_in_rope_changed:
		manager_request.submit_trick(TRICKS.VAR.ROPE)
		pos_in_rope_changed = false

func start_rope(rope: Rope):
	enabled = true
	node_rope = rope

func end_rope():
	enabled = false
	if node_rope:
		node_rope.update_rope_center(0)
	node_rope = null

func move(delta: float):
	var node: Clown = get_parent()
	node.velocity.z = 0
	node.velocity.y = 0

	if Input.is_action_just_pressed("ui_accept"):
		node.velocity.y = JUMP_VELOCITY
		node.velocity.x = 0
		end_rope()
		return
		
	if previous_pos_in_rope != node.global_position.x:
		pos_in_rope_changed = true
		previous_pos_in_rope = node.global_position.x
		
	# add cap
	if abs(node.velocity.x) > SPEED_CAP:
		node.velocity.x = sign(node.velocity.x) * SPEED_CAP
	
	if node_rope:
		node_rope.update_rope_center_from_pos(node.global_position)
		node.global_position.y = node_rope.middle_point.y
		node.global_position.z = node_rope.middle_point.z

