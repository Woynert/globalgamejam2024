extends Control
class_name ClownWidgets

@onready var node_hand = $"../Hand"
@onready var node_rope = $"../Rope"
@onready var widget_mouse = $Control/UiWidgetMouse
@onready var widget_monocycle = $Control/UiWidgetMonocycle

func _ready():
	widget_mouse.set_button(0)
	widget_monocycle.visible = false

func _physics_process(delta):
	if node_hand.doing_hand_trick || node_hand.item_recently_picked_up:
		if node_hand.hand_trick_phase:
			widget_mouse.set_button(1)
		else:
			widget_mouse.set_button(2)
	else:
		widget_mouse.set_button(0)
	
	if node_rope.enabled:
		var angle = rad_to_deg(Vector3.UP.angle_to(node_rope.pin_direction)) * sign(node_rope.pin_direction.z)
		print(angle)
		widget_monocycle.set_value((angle + node_rope.ANGLE_TO_FAIL) / (node_rope.ANGLE_TO_FAIL * 2)) 
		widget_monocycle.visible = true
	else:
		widget_monocycle.visible = false
