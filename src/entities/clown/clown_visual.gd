extends Node3D
class_name ClownVisual

enum STATE_LOWER {
	IDLE,
	WALK,
	MONOCYCLE,
	JUMP,
	CAIDA,
}

enum STATE_UPPER {
	
}

@onready var clown: Clown = get_parent()
@onready var ani_player_low: AnimationPlayer = $AnimationPlayerLow
@onready var ani_player_up: AnimationPlayer = $AnimationPlayerUp
@onready var sprite_low: AnimatedSprite3D = $sprites/SpriteLower
@onready var sprite_up: AnimatedSprite3D = $sprites/SpriteUpper

var previous_orientation: bool = true
var walking: bool = false
var on_floor: bool = false
var on_rope: bool = false
var on_monocycle: bool = false

func _ready():
	var walk_controller = $"../WalkController" as Node3D

func _physics_process(delta):
	walking = clown.velocity != Vector3.ZERO
	if walking:
		previous_orientation = clown.velocity.x > 0
		if previous_orientation:
			scale.x = 1
			#sprite_low.flip_h = true
			#sprite_up.flip_h = true
		else:
			scale.x = -1
			#sprite_low.flip_h = false
			#sprite_up.flip_h = false
	
	on_floor = clown.is_on_floor_shapecast()
	on_rope = clown.node_rope.enabled
	on_monocycle = clown.node_monocycle.enabled
	
	# apply
	on_floor = on_floor || on_rope
	
	var move_animation = "walk"
	if on_monocycle:
		move_animation = "monocycle"
		scale.x = sign(clown.node_monocycle.pin_direction.x)
		$sprites.rotation.z = -(Vector3.UP).angle_to(clown.node_monocycle.pin_direction)
		$sprites.position.y = 0.05
	else:
		$sprites.rotation.z = 0
		$sprites.position.y = 0
	
	if walking && on_floor:
		ani_player_low.play(move_animation)
		ani_player_up.play(move_animation)
		print(ani_player_up.current_animation)
	elif !walking && on_floor:
		ani_player_low.play("idle")
		ani_player_up.play("idle")
	elif (walking && !on_floor || !walking && !on_floor):
		ani_player_low.play("jump")
		ani_player_up.play("jump")

func update_animation ():
	pass
