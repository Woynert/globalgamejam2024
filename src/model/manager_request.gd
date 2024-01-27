extends Node
class_name ManagerRequest

"""
This node is in charge of managing all the logic regarding the public requests
"""

@onready var timer_request = $TimerRequest as Timer
@onready var timer_public_review = $TimerPublicReview as Timer
var BOREDOM_RATE = 5
var LAUGH_TINY = 10
var LAUGH_MEDIUM = 20
var LAUGH_LARGE = 30

func _ready():
	start()

func start():
	PublicRequest.generate_request()
	timer_request.timeout.connect(_timer_request_timeout)
	timer_request.start()
	timer_public_review.timeout.connect(_timer_public_review_timeout)
	timer_public_review.start()

func _timer_request_timeout():
	PublicRequest.generate_request()
	
func _timer_public_review_timeout():
	GlobalState.set_laugh(GlobalState.laugh - BOREDOM_RATE)

func submit_trick(tricks: Array[int]):
	print("tricks submitted %s" % tricks)
	GlobalState.set_laugh(GlobalState.laugh + LAUGH_MEDIUM)
	
func submit_failure(trick: int):
	print("trick failed %d" % trick)
