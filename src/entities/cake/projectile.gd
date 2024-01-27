extends Area3D
class_name Projectile

const SPEED: float = 5.0
var direction: Vector3

func _ready():
	body_entered.connect(_on_body_entered)
	
func start(p_direction: Vector3):
	direction = p_direction
	($visual as Node3D).look_at(global_position + direction * 10)

func _physics_process(delta):
	global_position += direction * SPEED * delta

func _on_body_entered(body):
	self.queue_free()
