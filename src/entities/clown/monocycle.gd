extends Node3D

const ANGLE_INCREASE = 0.005
const RECOVERY_INCREASE = 0.02

const ACC = 8
const MAX_VELOCITY = 5
const GRAVITY = 18.2
const ANGLE_TO_FALL = 30 # degrees

@onready var timer_monocycle = $TimerMonocycle as Timer
var enabled = false
var pin_direction: Vector3 = Vector3.UP

func _ready():
	timer_monocycle.timeout.connect(_timer_monocycle_timeout)
	timer_monocycle.start()

func _timer_monocycle_timeout():
	var manager_request = SharedRes.manager_request as ManagerRequest
	if enabled:
		manager_request.submit_trick(TRICKS.VAR.MONOCYCLE)

func move(node: CharacterBody3D, delta: float):
	
	if pin_direction.normalized() == Vector3.UP:
		pin_direction = pin_direction.rotated(Vector3.FORWARD, deg_to_rad(1))
	
	# get dir we're moving towards
	var dir_up_to_pin = Vector3.UP.direction_to(pin_direction)
	var dir_current = Vector3(dir_up_to_pin.x, 0, dir_up_to_pin.z).normalized()
	
	# get dir we're going to move to
	var input_dir_2 = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	var input_dir = Vector3(input_dir_2.x, 0, 0).normalized()
	var dir_desired = input_dir.normalized()
	if input_dir == Vector3.ZERO:
		dir_desired = dir_current.normalized()
	
	# apply different speeds
	if dir_desired.x != dir_current.x:
		dir_desired *= RECOVERY_INCREASE
	else:
		dir_desired *= ANGLE_INCREASE
	
	pin_direction = (pin_direction + dir_desired).normalized()
	
	# fail
	var angle = rad_to_deg(Vector3.UP.angle_to(pin_direction))
	if angle >= ANGLE_TO_FALL:
		fall()
	
	# apply movement
	var dir_horizontal = Vector3(pin_direction.x, 0, input_dir_2.y).normalized()
	node.velocity += dir_horizontal * ACC * delta
	if node.velocity.length() > MAX_VELOCITY:
		node.velocity = node.velocity.normalized() * MAX_VELOCITY
	
	# gravity
	if not node.is_on_floor():
		node.velocity.y -= GRAVITY * delta
	
	# unmount
	if Input.is_action_just_pressed("game_unmount_monocycle"):
		unmount()
	
	($RayCast3D2 as RayCast3D).target_position = pin_direction
	($RayCast3D as RayCast3D).target_position = dir_horizontal
	
func fall():
	print("D: You failed the monocycle")
	unmount()
	
	var manager_request = SharedRes.manager_request as ManagerRequest
	manager_request.submit_failure(TRICKS.VAR.MONOCYCLE)

func unmount():
	print("D: You unmounted the monocycle")
	enabled = false
	pin_direction = Vector3.UP
