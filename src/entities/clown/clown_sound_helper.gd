extends Node
class_name ClownSoundHelper
var last_time_reacted = 0

@onready var clown = get_parent() as Clown
var on_floor = false
var on_rope = false
var on_monocycle = false

func _ready():
	$TimerAtention.timeout.connect(_on_timer_atention)
	
func _on_timer_atention():
	$TimerAtention.wait_time = randf_range(10, 5)
	last_time_reacted = Time.get_ticks_msec()
	var audio_file = ManagerSound.AUDIO.BUU_1
	if GlobalState.laugh < 33:
		audio_file = [ManagerSound.AUDIO.BUU_1, ManagerSound.AUDIO.BUU_2].pick_random()
	elif GlobalState.laugh < 66:
		audio_file = [ManagerSound.AUDIO.APLAUSA_SARCASTICO, ManagerSound.AUDIO.APLAUSO_GRUPAL].pick_random()
	elif GlobalState.laugh <= 100:
		audio_file = [ManagerSound.AUDIO.APLAUSO_DIARIO_1, ManagerSound.AUDIO.APLAUSO_DIARIO_2].pick_random()
	SharedRes.get_manager_sound().play_stream(audio_file)
	
func _physics_process(delta):
	on_floor = clown.is_on_floor_shapecast()
	on_rope = clown.node_rope.enabled
	on_monocycle = clown.node_monocycle.enabled
	if on_monocycle:
		SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_PLAYFUL)
	elif on_rope:
		SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_CUERDA)
	else:
		SharedRes.get_manager_sound().play_stream_loop(ManagerSound.AUDIO.LOOP_CIRCUS_AMBIENT_INTRO)
	
