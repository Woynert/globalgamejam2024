extends Node3D
class_name Hand

var has_item: bool = false
var item: ITEMS.VAR
var doing_hand_trick: bool = false
var hand_trick_phase: bool = false
var hand_trick_usable: bool = false

@onready var hand_trick_item_scene = preload("res://src/entities/clown/hand_trick_item.tscn")
var hand_trick_item: HandTrickItem = null
@onready var hand_trick_limit_up: Node3D = $HandTrickLimitUp
@onready var hand_trick_limit_down: Node3D = $HandTrickLimitDown

func unset_item():
	has_item = false

func set_item(p_item: ITEMS.VAR):
	item = p_item
	has_item = true

func is_action_hand_trick_pressed() -> bool:
	var action_pressed = false
	match hand_trick_phase:
		false:
			action_pressed = Input.is_action_just_pressed("game_hand_trick_a")
		true:
			action_pressed = Input.is_action_just_pressed("game_hand_trick_b")
	if action_pressed:
		hand_trick_phase = !hand_trick_phase
	return action_pressed

func _physics_process(delta):
	if !doing_hand_trick:
		if is_action_hand_trick_pressed() && has_item:
			doing_hand_trick = true
			start_hand_trick()
	else:
		if !hand_trick_item:
			return
		
		if (hand_trick_item.position.y < hand_trick_limit_up.position.y &&
			hand_trick_item.position.y > hand_trick_limit_down.position.y &&
			hand_trick_usable):
			print("in range")
			
			if (is_action_hand_trick_pressed()):
				print("launch")
				hand_trick_item.launch()
				hand_trick_usable = false
			
		# let it be usable
		if hand_trick_item.position.y > hand_trick_limit_up.position.y +2:
			hand_trick_usable = true
			
		# lose
		if hand_trick_item.position.y < hand_trick_limit_down.position.y:
			stop_hand_trick()
			
func start_hand_trick():
	print("Starting hand trick")
	hand_trick_usable = false
	hand_trick_item = hand_trick_item_scene.instantiate() as HandTrickItem
	hand_trick_item.setup(hand_trick_limit_down.position.y + 0.1)
	self.add_child(hand_trick_item)
	
func stop_hand_trick():
	doing_hand_trick = false
	hand_trick_phase = false
	hand_trick_usable = false
	print("Stopping hand trick")
	if is_instance_valid(hand_trick_item):
		(hand_trick_item as Node3D).queue_free()
	
