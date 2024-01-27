extends Control

@onready var label_template = $template/LabelTemplate
@onready var button_template = $template/ButtonTemplate
@onready var grid_payment = $Control2/VBoxContainer/GridPayment
@onready var grid_rest = $Control2/VBoxContainer/GridRest
@onready var button_next = $Control3/ButtonNext

func _ready():
	start()

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
	label.text = "%d$" % GlobalState.savings
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_payment.add_child(label)
	
	# rent
	label = label_template.duplicate()
	label.text = "RENT"
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = "-%d$" % GlobalState.cost_rent
	grid_payment.add_child(label)
	button = button_template.duplicate()
	button.text = "pay"
	grid_payment.add_child(button)
	button.pressed.connect(pay_rent)
	
	# food
	label = label_template.duplicate()
	label.text = "FOOD"
	grid_payment.add_child(label)
	label = label_template.duplicate()
	label.text = "-%d$" % GlobalState.cost_food
	grid_payment.add_child(label)
	button = button_template.duplicate()
	button.text = "pay"
	grid_payment.add_child(button)
	button.pressed.connect(pay_food)
	
	# remaining money
	label = label_template.duplicate()
	label.text = "REMAINING"
	grid_rest.add_child(label)
	label = label_template.duplicate()
	label.text = "%d$" % GlobalState.savings
	grid_rest.add_child(label)
	label = label_template.duplicate()
	label.text = ""
	grid_rest.add_child(label)
	
func pay_rent ():
	print("1")
	
func pay_food ():
	print("2")
	
func next_day ():
	print("3")
