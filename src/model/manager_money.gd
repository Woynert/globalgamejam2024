extends Node
class_name ManagerMoney

var prev_profit = 0 

func _ready():
	$TimerEarn.timeout.connect(_on_timer_earn)
	$TimerEarn.start()

func _on_timer_earn():
	earn_money()
	
func earn_money():
	var max_profit = GlobalState.min_payment_per_s
	if GlobalState.day_profit < GlobalState.ideal_payment_per_day:
		max_profit = (float(-GlobalState.max_payment_per_s) / GlobalState.ideal_payment_per_day) * GlobalState.day_profit + GlobalState.max_payment_per_s
	max_profit = ceil(max_profit)
	var profit = ceil((GlobalState.laugh / 100.0) * max_profit)
	
	# print("%d : %d : %d " % [max_profit, profit, GlobalState.laugh])
	GlobalState.day_profit += profit
	GlobalState.money_per_second = (prev_profit + profit) / 2.0
	prev_profit = profit
