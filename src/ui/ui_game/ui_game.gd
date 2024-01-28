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
	set_value_money(GlobalState.savings)
	update_timeleft()

# setters

func set_value_health(value):
	($UiBarHealth as UiBar).set_bar_value(value)

func set_value_laugh(value):
	($UiBarLaugh as UiBar).set_bar_value(value)

func set_value_experience(value):
	($LabelExperience as Label).text = str("Exp: %d" % value)

func set_value_money(value):
	($LabelMoney as Label).text = str("Money: %d (+%d/sec)" % [value, GlobalState.money_per_second])

func set_current_reequest(request: Array[int]):
	var text = ""
	for req in request:
		text += "%s\n" % TRICKS.NAMES[req]
	($LabelRequest as Label).text = str("Requests:\n%s" % text)
	$BubbleManager.update_bubbles(request)
	
func update_timeleft ():
	$LabelTime.text = str(int(SharedRes.get_manager_level().level_timer.time_left))

func update_day ():
	$LabelDay.text = "Day %d" % GlobalState.day
