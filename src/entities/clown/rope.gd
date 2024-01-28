extends Node3D

const JUMP_VELOCITY = 8.5
const SPEED_CAP = 2.0

var enabled: bool = false
var node_rope: Rope = null
var previous_pos_in_rope: float = 0
var pos_in_rope_changed: bool = false

# pin variables
const ANGLE_INCREASE = 0.008
const ANGLE_TO_FAIL = 60 # degrees

var pin_direction: Vector3 = Vector3.UP

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
	
	calculate_pin_direction()
	($RayCast3D as RayCast3D).target_position = pin_direction
	
	# fail
	var angle = rad_to_deg(Vector3.UP.angle_to(pin_direction))
	if angle >= ANGLE_TO_FAIL:
		fail()

func calculate_pin_direction():
	if pin_direction.normalized() == Vector3.UP:
		pin_direction = pin_direction.rotated(Vector3.RIGHT, deg_to_rad(1))
	
	# get dir we're moving towards
	var dir_up_to_pin = Vector3.UP.direction_to(pin_direction)
	var dir_current = Vector3(dir_up_to_pin.x, 0, dir_up_to_pin.z).normalized()
	
	# get dir we're going to move to
	var input_dir_2 = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	var input_dir = Vector3(0, 0, input_dir_2.y).normalized()
	var dir_desired = input_dir.normalized()
	if input_dir == Vector3.ZERO:
		dir_desired = dir_current.normalized()
	
	# apply different speeds
	if dir_desired.z != dir_current.z:
		if dir_current.z > 0:
			pin_direction = Vector3.UP.rotated(Vector3.RIGHT, deg_to_rad(-1))
		else:
			pin_direction = Vector3.UP.rotated(Vector3.RIGHT, deg_to_rad(1))
	else:
		dir_desired *= ANGLE_INCREASE
		pin_direction = (pin_direction + dir_desired).normalized()

func fail():
	print("D: You failed the rope")
	enabled = false
	pin_direction = Vector3.UP
	
	var manager_request = SharedRes.manager_request as ManagerRequest
	manager_request.submit_failure(TRICKS.VAR.ROPE)
	
	var node: Clown = get_parent()
	node.node_stunt_manager.enable(StuntManager.STUNT.FALL)
