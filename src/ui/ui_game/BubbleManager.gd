extends Control

var bubbles: Array[Node] = []

func _ready():
	bubbles = get_children()

func clear_bubbles ():
	for bubble in bubbles:
		bubble.hidding = true

func update_bubbles(request: Array[int]):
	clear_bubbles ()
	for i in range(request.size()):
		var trick = request[i]
		var bubble = bubbles[i]
		var resource = TRICKS.IMAGE_RESOURCE[trick]
		bubble.setup(resource)
