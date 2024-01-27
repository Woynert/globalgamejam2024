extends Node
# script autoloaded as GlobalState

# game vars

var experience: int = 0
var health: int = 100
var laugh: int = 50
var current_request: Array[int] = []

signal signal_request_changed

func reset():
	experience = 0
	health = 100
	laugh = 50
	current_request = []

func set_current_request(request: Array[int]):
	current_request = request
	signal_request_changed.emit()

func set_laugh(p_laugh: int):
	laugh = p_laugh
	laugh = clamp(laugh, 0, 100)
