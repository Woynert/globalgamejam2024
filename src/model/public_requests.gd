extends Node
class_name PublicRequest

const possible_requests = [
	[TRICKS.VAR.JUGGLE_BASTON],
	[TRICKS.VAR.JUGGLE_ANTORCHA],
	[TRICKS.VAR.JUGGLE_CUCHILLO],
	[TRICKS.VAR.JUGGLE_BASTON, TRICKS.VAR.MONOCYCLE],
	[TRICKS.VAR.JUGGLE_ANTORCHA, TRICKS.VAR.MONOCYCLE],
	[TRICKS.VAR.JUGGLE_CUCHILLO, TRICKS.VAR.MONOCYCLE],
]

static func generate_request ():
	# TODO: take in account the day and difficulty and experience
	var request_pick = possible_requests.pick_random()
	var request: Array[int] = []
	for r in request_pick:
		request.append(r)
	GlobalState.set_current_request(request)

