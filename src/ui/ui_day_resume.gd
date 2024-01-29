extends Control

@onready var label_template = $template/LabelTemplate
@onready var button_template = $template/ButtonTemplate
@onready var grid_payment = $Control2/VBoxContainer/GridPayment
@onready var grid_rest = $Control2/VBoxContainer/GridRest
@onready var button_next = $Control3/ButtonNext

var remaining: int = 0
var pay_food: bool = false
var pay_rent: bool = false

var label_remaining: Label = null
var button_pay_food: Button = null
var button_pay_rent: Button = null

func _ready():
	start()
	update_remaining()

func start():
	$template.visible = false
	var label: Label = null
	var button: Button = null
	
	$Control/LabelDay.text = "Day %d" % GlobalState.day
	$Control3/ButtonNext.pressed.connect(next_day)
	
	label = label_template.duplicate()
	label.text = "SAVINGS"
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = "+ %d$" % GlobalState.prev_savings
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	
	label = label_template.duplicate()
	label.text = "DAY PROFIT"
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = "+ %d$" % GlobalState.day_profit
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	
	# rent
	label = label_template.duplicate()
	label.text = "RENT"
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = "- %d$" % GlobalState.cost_rent
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	button_pay_rent = button_template.duplicate()
	button_pay_rent.text = "Pay"
	grid_payment.add_child(button_pay_rent)
	button_pay_rent.pressed.connect(toggle_pay_rent)
	
	# food
	label = label_template.duplicate()
	label.text = "FOOD"
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = "- %d$" % GlobalState.cost_food
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	button_pay_food = button_template.duplicate()
	button_pay_food.text = "Pay"
	grid_payment.add_child(button_pay_food)
	button_pay_food.pressed.connect(toggle_pay_food)
	
	# remaining money
	label = label_template.duplicate()
	label.text = "REMAINING"
	grid_rest.add_child(label)
	label = label_template.duplicate()
	label_remaining = label
	label.text = "%d$" % GlobalState.savings
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	grid_rest.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_rest.add_child(label)
	
func update_remaining():
	remaining = GlobalState.savings
	if pay_rent:
		remaining -= GlobalState.cost_rent
	if pay_food:
		remaining -= GlobalState.cost_food

	if remaining < 0:
		label_remaining.text = "%d$ (Insuficient funds)" % remaining
		button_next.disabled = true
	else:
		label_remaining.text = "%d$" % remaining
		button_next.disabled = false

func toggle_pay_food():
	pay_food = !pay_food
	if pay_food:
		button_pay_food.text = "Remove"
	else:
		button_pay_food.text = "Pay"
	update_remaining()
	SharedRes.get_manager_sound().play_stream(ManagerSound.AUDIO.KACHIN)
	
func toggle_pay_rent ():
	pay_rent = !pay_rent
	if pay_rent:
		button_pay_rent.text = "Remove"
	else:
		button_pay_rent.text = "Pay"
	update_remaining()
	SharedRes.get_manager_sound().play_stream(ManagerSound.AUDIO.KACHIN)

func next_day ():
	# pay up
	GlobalState.savings = remaining
	
	if !pay_rent:
		SharedRes.get_manager_events().event_gameover()
	else:
		if GlobalState.day >= 3:
			SharedRes.get_manager_events().event_win()
		else:
			SharedRes.get_manager_events().event_next_level()
