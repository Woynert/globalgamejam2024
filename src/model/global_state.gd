extends Node
# script autoloaded as GlobalState

# game vars

var current_request: Array[int] = []

signal signal_request_changed

func set_current_request(request: Array[int]):
	current_request = request
	signal_request_changed.emit()
