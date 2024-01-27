extends Node3D

var pin_direction: Vector3 = Vector3.UP
const ANGLE_INCREASE = 0.005
const RECOVERY_INCREASE = 0.02

func _physics_process(delta):
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
	
	($RayCast3D as RayCast3D).target_position = dir_desired
	($RayCast3D2 as RayCast3D).target_position = pin_direction
	#print("Pin direction %s" % pin_direction)
	
	
	
