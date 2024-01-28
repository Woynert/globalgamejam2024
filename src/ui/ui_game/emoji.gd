extends Control
var enabled = false
var velocity: Vector2 = Vector2.ZERO
var MAX_INITIAL_SPEED = 4
var VERTICAL_SPEED = 3
var ACC_H = 2
var ACC_V = 1

func _ready():
	visible = false
	$TimerLive.timeout.connect(_on_timer_live)
	$TimerVanish.timeout.connect(_on_timer_vanish)
	$TimerLive.start()

func _on_timer_live():
	$TimerVanish.start()
	
func _on_timer_vanish():
	self.queue_free()

func setup(texture: Texture):
	visible = true
	enabled = true
	$TextureRect.texture = texture
	$TextureRectShadow.texture = texture
	velocity.x = randf_range(-1, 1) * MAX_INITIAL_SPEED
	velocity.y = -VERTICAL_SPEED

func _physics_process(delta):
	if !enabled:
		return
	velocity.x = move_toward(velocity.x, 0, delta * ACC_H)
	velocity.y = move_toward(velocity.y, 0, delta * ACC_V)
	global_position += velocity
	
	if !$TimerVanish.is_stopped():
		modulate.a = $TimerVanish.time_left / $TimerVanish.wait_time
	
