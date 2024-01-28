extends Prop
class_name Cake

@export var canons: Array[Node3D] = []
@export var direction: Vector3 = Vector3.RIGHT
@onready var timer_shoot = $TimerShoot
@onready var projectile_scene = preload("res://src/entities/cake/projectile.tscn")

func _ready():
	timer_shoot.timeout.connect(_timer_shoot_timeout)
	
func _timer_shoot_timeout():
	# TODO: generate
	
	var excluded_canon = canons.pick_random()
	for canon in canons:
		if canon == excluded_canon:
			continue
		var projectile = projectile_scene.instantiate()
		projectile.global_position = canon.global_position
		self.add_child(projectile)
		projectile.global_position = canon.global_position
		projectile.start(basis * direction)
		print("Spawn %s" % projectile)
		
	SharedRes.get_manager_sound().play_stream(ManagerSound.AUDIO.CANON_EXPLOSION)
	
func start():
	timer_shoot.start()
	
func stop():
	timer_shoot.stop()
	
