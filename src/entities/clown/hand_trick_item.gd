extends Area3D
class_name HandTrickItem

var offset_y = 0
var velocity_y: float = 0
var starting_position: float = 0
const GRAVITY = 10

func _ready():
	launch()

func setup(p_starting_position: float):
	starting_position = p_starting_position

func _physics_process(delta):
	velocity_y -= GRAVITY * delta
	position.y += velocity_y * delta

func launch():
	position.y = starting_position
	velocity_y = 10
