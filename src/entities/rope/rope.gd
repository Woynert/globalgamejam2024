extends Prop
class_name Rope

@export var node_rope_finish: Node3D = null
@export var node_rope_collision_shape: CollisionShape3D = null
@onready var line_scene = preload("res://src/entities/rope/line.tscn")
var segment_1: Node3D = null 
var segment_2: Node3D = null
var middle_point: Vector3

func _ready():
	segment_1 = create_line(global_position, node_rope_finish.global_position)
	segment_2 = create_line(node_rope_finish.global_position, global_position)
	update_rope_center(0)
	
	node_rope_collision_shape.reparent(self)
	#node_rope_area.body_exited.connect(_body_exited_area)
	#pass

#func _body_exited_area(body):
#	if body is Clown:
#		(body as Clown).node_rope.end_rope()

func update_rope_center_from_pos(pos: Vector3):
	var distance_rope = global_position.distance_to(node_rope_finish.global_position)
	var distance = pos.distance_to(global_position)
	var center = distance / distance_rope
	return update_rope_center(center)

func update_rope_center(p_center: float):
	var center: float = clamp(p_center, 0, 1.0)
	middle_point = global_position + (node_rope_finish.global_position - global_position) * center
	middle_point.y = (global_position.y + node_rope_finish.global_position.y)/2 + sin(center * PI) * (-1)
	position_line(segment_1, global_position, middle_point)
	position_line(segment_2, middle_point, node_rope_finish.global_position)

func create_line(p_from: Vector3, p_to: Vector3) -> Node3D:
	var from = p_from
	var to = p_to
	var line = line_scene.instantiate() as Node3D
	self.add_child(line)
	position_line(line, from, to)
	return line

func position_line(line: Node3D, p_from: Vector3, p_to: Vector3):
	line.global_position = p_from
	line.scale.z = p_from.distance_to(p_to)
	line.look_at_from_position(p_from, p_to)

