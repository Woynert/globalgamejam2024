extends Panel
var value: float = 0
var marker_width = 4
@export var horizontal = true

func _draw():
	var color = Color.WHITE
	draw_rect(Rect2(Vector2.ZERO, size), color)
	color = Color.RED
	
	if horizontal:
		draw_rect(Rect2(Vector2(size.x * value - marker_width, 0), Vector2(marker_width, size.y)), color)
	else:
		draw_rect(Rect2(Vector2(0, size.y * value - marker_width), Vector2(size.x, marker_width)), color)
	
