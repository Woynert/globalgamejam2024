extends Node3D

const SPEED = 5.0
const JUMP_VELOCITY = 8.5
const GRAVITY = 18.2

func move(delta: float, use_gravity: bool = true):
	var node: Clown = get_parent()
	if use_gravity:
		if not node.is_on_floor_shapecast():
			node.velocity.y -= GRAVITY * delta
		else:
			node.velocity.y = 0
		if Input.is_action_just_pressed("ui_accept") and node.is_on_floor_shapecast():
			node.velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		node.velocity.x = direction.x * SPEED
		node.velocity.z = direction.z * SPEED
	else:
		node.velocity.x = move_toward(node.velocity.x, 0, SPEED)
		node.velocity.z = move_toward(node.velocity.z, 0, SPEED)
