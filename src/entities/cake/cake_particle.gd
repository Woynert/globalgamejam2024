extends Node3D

func _ready():
	$AnimatedSprite3D.play()
	$AnimatedSprite3D.animation_finished.connect(queue_free)
