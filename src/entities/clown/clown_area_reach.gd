extends Area3D

var there_is_reachable_item: bool = false
var item_in_reach: TRICKS.VAR = 0
var item_in_reach_prop: Prop = null

@export var text_billiboard: Label3D
@export var hand: Hand
#@onready var clown: Clown = get_parent()
@onready var monocycle = $"../Monocycle"
@onready var rope = $"../Rope"
@onready var cake_controller = $"../CakeController"

func _ready():
	body_entered.connect(_area_body_entered)
	body_exited.connect(_area_body_exited)
	area_entered.connect(_area_area_entered)

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

	elif body is Projectile:
		if cake_controller.enabled:
			cake_controller.fail()

func _area_body_exited(body: Node3D):
	if body is Prop:
		if body.item == item_in_reach:
			there_is_reachable_item = false
			text_billiboard.text = ""
			item_in_reach_prop = null
			
			if body.item == TRICKS.VAR.ROPE:
				rope.end_rope()
	elif body is CakePlayArea:
		print("wawa")
		if cake_controller.enabled:
			cake_controller.stop()
			
func _area_area_entered(area: Node3D):
	if area is Projectile:
		if cake_controller.enabled:
			cake_controller.fail()
			area.queue_free()
			var clown = get_parent()
			clown.node_stunt_manager.enable(StuntManager.STUNT.HEADACHE)

func _physics_process(delta):
	if there_is_reachable_item:
		if Input.is_action_just_pressed("game_pickup"):
			print("Selected " + str(TRICKS.NAMES[item_in_reach]))
			if item_in_reach in TRICKS.HANDEABLE:
				hand.set_item(item_in_reach)
			elif item_in_reach == TRICKS.VAR.MONOCYCLE:
				monocycle.enabled = true
			elif item_in_reach == TRICKS.VAR.CAKE:
				if not item_in_reach_prop is Cake:
					printerr("E: item of type Cake isn't Cake prop")
					return
				cake_controller.start(item_in_reach_prop)

