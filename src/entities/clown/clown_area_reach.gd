extends Area3D

var there_is_reachable_item: bool = false
var item_in_reach: TRICKS.VAR = 0
var item_in_reach_prop: Prop = null

@export var text_billiboard: Label3D
@export var hand: Hand
#@onready var clown: Clown = get_parent()
@onready var monocycle = $"../Monocycle"
@onready var rope = $"../Rope"

func _ready():
	body_entered.connect(_area_body_entered)
	body_exited.connect(_area_body_exited)

func _area_body_entered(body: Node3D):
	if body is Prop:
		if there_is_reachable_item:
			return
		there_is_reachable_item = true
		item_in_reach = body.item
		item_in_reach_prop = body
		if item_in_reach in TRICKS.HANDEABLE:
			text_billiboard.text = str(TRICKS.NAMES[item_in_reach]) + " (E to pickup)"
		else:
			text_billiboard.text = str(TRICKS.NAMES[item_in_reach]) + " (E to use)"
		
		if item_in_reach == TRICKS.VAR.ROPE:
			rope.start_rope(item_in_reach_prop)
			print("start")

func _area_body_exited(body: Node3D):
	if body is Prop:
		if body.item == item_in_reach:
			there_is_reachable_item = false
			text_billiboard.text = ""
			item_in_reach_prop = null
			
			if body.item == TRICKS.VAR.ROPE:
				rope.end_rope()

func _physics_process(delta):
	if there_is_reachable_item:
		if Input.is_action_just_pressed("game_pickup"):
			if item_in_reach in TRICKS.HANDEABLE:
				hand.set_item(item_in_reach)
			elif item_in_reach == TRICKS.VAR.MONOCYCLE:
				monocycle.enabled = true
			print("Selected " + str(TRICKS.NAMES[item_in_reach]))

