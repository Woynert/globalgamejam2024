extends Node
# script autoloaded as GlobalState

# game vars

var experience: int = 0
var health: int = 100
var laugh: int = 50
var current_request: Array[int] = []

# day related

var day: int = 1
var day_duration: int = 20 # seconds
var savings: int = 150
var cost_rent: int = 100
var cost_food: int = 20

signal signal_request_changed

func reset():
	experience = 0
	health = 100
	laugh = 50
	set_current_request([])

func set_current_request(request: Array[int]):
	current_request = request
	signal_request_changed.emit()
	print("current_request %s" % current_request)

func set_laugh(p_laugh: int):
	laugh = p_laugh
	laugh = clamp(laugh, 0, 100)
