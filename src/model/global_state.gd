extends Node
# script autoloaded as GlobalState

# game vars

var experience: int = 0
var health: int = 100
var laugh: int = 100
var current_request: Array[int] = []

# day related

var day: int = 1
var day_duration: int = 60 # seconds
var savings_initial_value: int = 50
var savings: int = savings_initial_value
var prev_savings: int = 110

var day_profit: int = 0
var money_per_second: float = 0
var cost_rent: int = 100
var cost_food: int = 20

var ideal_payment_per_day: int = 200
var max_payment_per_s: int = 6
var min_payment_per_s: int = 1

signal signal_request_changed

func prepare_values_for_next_day():
	health = 100
	laugh = 50
	day_profit = 0
	set_current_request([])

func set_current_request(request: Array[int]):
	current_request = request
	signal_request_changed.emit()
	print("current_request %s" % current_request)

func set_laugh(p_laugh: int):
	laugh = p_laugh
	laugh = clamp(laugh, 0, 100)
