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
	
	var generate_easy = [true, false].pick_random()
	var generate_medium = [true, false].pick_random()
	var generate_hard = [true, false].pick_random()
	var forceful = 0
	if !generate_easy && !generate_medium && !generate_hard:
		forceful = [1,2,3].pick_random()
	
	var request: Array[int] = []
	if generate_easy || forceful == 1: request.append(TRICKS.HANDEABLE.pick_random())
	if generate_medium || forceful == 2: request.append(TRICKS.MOUNTABLE.pick_random())
	if generate_hard || forceful == 3: request.append(TRICKS.ON_SITE.pick_random())
	
	GlobalState.set_current_request(request)
