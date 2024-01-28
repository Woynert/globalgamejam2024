extends Control
var trick: TRICKS.VAR

var appearing: bool = false
var hidding: bool = false
var visibility_level: float = 0

func _ready():
	modulate.a = 0

func _physics_process(delta):
	if hidding:
		visibility_level -= delta
		if visibility_level < 0:
			visibility_level = 0
			hidding = false
		modulate.a = visibility_level
	elif appearing:
		visibility_level += delta
		if visibility_level > 1:
			visibility_level = 1
			appearing = false
		modulate.a = visibility_level

func setup(resource: Texture):
	($TextureIcon as TextureRect).texture = resource
	hidding = false
	appearing = true
