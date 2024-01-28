extends Area3D
class_name Projectile

const SPEED: float = 5.0
var direction: Vector3
var cake_particle_scene = preload("res://src/entities/cake/cake_particle.tscn")

func _ready():
	body_entered.connect(_on_body_entered)
	
func start(p_direction: Vector3):
	direction = p_direction
	($visual as Node3D).look_at(global_position + direction * 10)

func _physics_process(delta):
	global_position += direction * SPEED * delta

func _on_body_entered(body):
	destroy()
	
func destroy():
	var particle = cake_particle_scene.instantiate()
	get_parent().add_child(particle)
	particle.global_position = global_position
	SharedRes.get_manager_sound().play_stream(ManagerSound.AUDIO.CAKE_ON_FACE)
	self.queue_free()
