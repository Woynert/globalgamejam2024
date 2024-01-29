extends Control
class_name UiGame

func _ready():
	GlobalState.signal_request_changed.connect(_on_current_request_changed)
	_on_current_request_changed()
	update_day()

# signals

func _on_current_request_changed():
	print("Current request chagnged to %s" % GlobalState.current_request)
	set_current_reequest(GlobalState.current_request)

func _physics_process(delta):
	set_value_health(GlobalState.health)
	set_value_laugh(GlobalState.laugh)
	set_value_money(GlobalState.day_profit)
	update_timeleft()

# setters

func set_value_health(value):
	# TODO
	#($Bar/VBoxContainer/Grid/InfoHealth as UiBar).set_value(value)
	pass

func set_value_laugh(value):
	pass # TODO: EMOJIS

func set_value_experience(value):
	# TODO
	#($Bar/VBoxContainer/Grid/InfoExp as UiBar).set_value(value)
	pass

func set_value_money(value):
	($Bar/VBoxContainer/Grid/InfoMoney as UiBar).set_value(str("Money: %d (+%d/sec)" % [value, GlobalState.money_per_second]))

func set_current_reequest(request: Array[int]):
	$BubbleManager.update_bubbles(request)
	
func update_timeleft ():
	$DayInfo/MarginContainer/VBoxContainer/HBoxContainer/LabelTime.text = str(int(SharedRes.get_manager_level().level_timer.time_left))

func update_day ():
	$DayInfo/MarginContainer/VBoxContainer/LabelDay.text = "Day %d" % GlobalState.day
