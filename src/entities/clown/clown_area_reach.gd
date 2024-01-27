extends Area3D

var there_is_reachable_item: bool = false
var item_in_reach: TRICKS.VAR = 0
@export var text_billiboard: Label3D
@export var hand: Hand

func _ready():
	body_entered.connect(_area_body_entered)
	body_exited.connect(_area_body_exited)

func _area_body_entered(body: Node3D):
	if body is Prop:
		if there_is_reachable_item:
			return
		there_is_reachable_item = true
		item_in_reach = body.item
		text_billiboard.text = str(TRICKS.NAMES[item_in_reach]) + " (E to pickup)"

func _area_body_exited(body: Node3D):
	if body is Prop:
		if body.item == item_in_reach:
			there_is_reachable_item = false
			text_billiboard.text = ""

func _physics_process(delta):
	if Input.is_action_just_pressed("game_pickup"):
		if there_is_reachable_item:
			if item_in_reach in TRICKS.HANDEABLE:
				print("Selected " + str(TRICKS.NAMES[item_in_reach]))
				hand.set_item(item_in_reach)
