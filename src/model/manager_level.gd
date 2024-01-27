extends Node
class_name ManagerLevel

@onready var level_scene = preload("res://src/level/level_pilot.tscn")
@onready var level_root_node: Node3D = $LevelRoot
@onready var level_timer: Timer = $TimerLevel

func _ready():
	level_timer.wait_time = GlobalState.day_duration
	level_timer.timeout.connect(_on_level_timeout)

func _on_level_timeout ():
	print("D: Level timeout")
	SharedRes.get_manager_events().event_finish_day()

# events

func unload_level ():
	timer_stop()
	var children = level_root_node.get_children()
	for child in children:
		child.queue_free()

func load_level ():
	var level = level_scene.instantiate()
	level_root_node.add_child(level)
	
func timer_stop ():
	timer_pause ()
	
func timer_pause ():
	level_timer.paused = true

func timer_start ():
	level_timer.paused = false
	level_timer.start(level_timer.wait_time)

