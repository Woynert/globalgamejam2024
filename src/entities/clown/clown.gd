extends CharacterBody3D
class_name Clown

@onready var hand_node = $Hand as Hand
@onready var area_reach = $TextBilliboard as Area3D
@onready var text_billiboard = $TextBilliboard as Label3D

const SPEED = 5.0
const JUMP_VELOCITY = 8.5
const GRAVITY = 18.2

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
