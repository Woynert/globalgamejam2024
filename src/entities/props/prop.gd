extends Node3D
class_name Prop

@export var item: TRICKS.VAR

func _ready():
	$visual/bastones.visible = false
	$visual/antorcha.visible = false
	$visual/cuchillas.visible = false
	$visual/monocycle.visible = false
	match item:
		TRICKS.VAR.JUGGLE_BASTON:
			$visual/bastones.visible = true
		TRICKS.VAR.JUGGLE_ANTORCHA:
			$visual/antorcha.visible = true
		TRICKS.VAR.JUGGLE_CUCHILLO:
			$visual/cuchillas.visible = true
		TRICKS.VAR.MONOCYCLE:
			$visual/monocycle.visible = true
