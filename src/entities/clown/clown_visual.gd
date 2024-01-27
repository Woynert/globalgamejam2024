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
var doing_hand_trick: bool = false

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
	doing_hand_trick = $"../Hand".doing_hand_trick
	
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
		if !doing_hand_trick: ani_player_up.play(move_animation)
	elif !walking && on_floor:
		ani_player_low.play("idle")
		if !doing_hand_trick: ani_player_up.play("idle")
	elif (walking && !on_floor || !walking && !on_floor):
		ani_player_low.play("jump")
		if !doing_hand_trick: ani_player_up.play("jump")
		
	if doing_hand_trick:
		sprite_up.position.z = -0.1
		match ani_player_low.current_animation:
			"idle":
				ani_player_up.play("idle_jiggle")
			"walk", "jump":
				ani_player_up.play("walk_jiggle")
			"monocycle":
				ani_player_up.play("monocycle_jiggle")
	else:
		sprite_up.position.z = 0.1

func update_animation ():
	pass
