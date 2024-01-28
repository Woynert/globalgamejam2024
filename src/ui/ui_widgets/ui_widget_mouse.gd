extends Control

@onready var tex_mouse_full = preload("res://resource_remote/symbol/mouse_full.png")
@onready var tex_mouse_left = preload("res://resource_remote/symbol/mouse_left.png")
@onready var tex_mouse_right = preload("res://resource_remote/symbol/mouse_right.png")
@export var SIZE = Vector2(100, 100)

var button = 0
var color_accent = 0
var color_base = Color.WHITE

func _draw():
	if button == 0:
		return
	draw_texture_rect(tex_mouse_full, Rect2(Vector2.ZERO, SIZE), false, color_base)
	if button == 2:
		draw_texture_rect(tex_mouse_left, Rect2(Vector2.ZERO, SIZE), false, Color.LIGHT_SLATE_GRAY.lerp(color_base, sin(color_accent)))
	elif button == 1:
		draw_texture_rect(tex_mouse_right, Rect2(Vector2.ZERO, SIZE), false, Color.LIGHT_SLATE_GRAY.lerp(color_base, sin(color_accent)))

func _physics_process(delta):
	color_accent += delta * 4
	queue_redraw()
	
func set_button(p_button: int):
	button = p_button
