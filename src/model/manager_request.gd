extends Node
class_name ManagerRequest

"""
This node is in charge of managing all the logic regarding the public requests
"""

@onready var timer_request = $TimerRequest as Timer
@onready var timer_public_review = $TimerRequest as Timer

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
	print("")
	pass

func submit_trick(tricks: Array[int]):
	print("tricks submitted %s" % tricks)
	
func submit_failure(trick: int):
	print("trick failed %d" % trick)
