extends Control
@onready var texture = $TextureRect
signal pressed
func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	if (mouse_pos.x > global_position.x &&
		mouse_pos.y > global_position.y &&
		mouse_pos.x < global_position.x + size.x &&
		mouse_pos.y < global_position.y + size.y):
		texture.modulate = Color.hex(0xff8dff)
		if Input.is_action_just_pressed("game_mouse_left"):
			pressed.emit()
	else:
		texture.modulate = Color.WHITE
