extends Node3D
class_name StuntManager
const GRAVITY = 18.2
enum STUNT {
	FALL,
	HEADACHE
}

var enabled = false
var variant: int = 0

func enable(p_variant: int):
	var node: Clown = get_parent()
	if node.node_monocycle.enabled:
		node.node_monocycle.unmount()
	if node.node_rope.enabled:
		node.node_rope.end_rope()
	if ($"../Hand" as Hand).doing_hand_trick:
		($"../Hand" as Hand).stop_hand_trick()
	
	variant = p_variant
	enabled = true
	$TimerRecovery.timeout.connect(_timer_recovery_timeout)
	$TimerRecovery.start()

func _timer_recovery_timeout():
	enabled = false

func move (delta: float):
	var node: Clown = get_parent()
	if not node.is_on_floor_shapecast():
		node.velocity.y -= GRAVITY * delta
	else:
		node.velocity.y = 0
