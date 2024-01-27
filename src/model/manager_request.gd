extends Node
class_name ManagerRequest

"""
This node is in charge of managing all the logic regarding the public requests
"""

@onready var timer_request = $TimerRequest as Timer
@onready var timer_public_review = $TimerPublicReview as Timer
var BOREDOM_RATE = 3
var LAUGH_VALUE = 30
var FAIL_PENALTY = 10

func _ready():
	start()

func start():
	timer_request.timeout.connect(_timer_request_timeout)
	timer_request.start()
	timer_public_review.timeout.connect(_timer_public_review_timeout)
	timer_public_review.start()

func _timer_request_timeout():
	PublicRequest.generate_request()
	
func _timer_public_review_timeout():
	GlobalState.set_laugh(GlobalState.laugh - BOREDOM_RATE)

func submit_trick(trick: int):
	var satisfaction: float = 1.0 / GlobalState.current_request.size()
	if not trick in GlobalState.current_request:
		satisfaction *= 0.4
	print(satisfaction)
	GlobalState.set_laugh(GlobalState.laugh + satisfaction * LAUGH_VALUE)
	print("trick submitted %d" % trick)
	
func submit_failure(trick: int):
	GlobalState.set_laugh(GlobalState.laugh - FAIL_PENALTY)
	print("trick failed %d" % trick)
