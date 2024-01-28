extends Area3D
class_name HandTrickItem

var offset_y = 0
var velocity_y: float = 0
var starting_position: float = 0
const GRAVITY = 10
const ROTATION = 8
var rotation_dir = 1

func _ready():
	launch()

func setup(p_starting_position: float, item: TRICKS.VAR):
	starting_position = p_starting_position
	
	match item:
		TRICKS.VAR.JUGGLE_BASTON:
			$visual/SpriteItems.animation = "baston"
		TRICKS.VAR.JUGGLE_ANTORCHA:
			$visual/SpriteItems.animation = "antorcha"
			$visual/SpriteItems/Fire.visible = true
			$visual/SpriteItems/Fire.play("default")
		TRICKS.VAR.JUGGLE_CUCHILLO:
			$visual/SpriteItems.animation = "cuchillo"
	

func _physics_process(delta):
	velocity_y -= GRAVITY * delta
	position.y += velocity_y * delta
	$visual/SpriteItems.rotation.z += ROTATION * delta * rotation_dir

func launch():
	position.y = starting_position
	velocity_y = 10
	rotation_dir = -rotation_dir
