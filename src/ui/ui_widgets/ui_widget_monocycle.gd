extends Control

func _physics_process(delta):
	if Input.is_action_just_pressed("game_up"):
		var panel = ($KeyA as Node).get("theme_override_styles/panel") 
		panel.bg_color = Color.RED
	if Input.is_action_just_released("game_up"):
		var panel = ($KeyA as Node).get("theme_override_styles/panel") 
		panel.bg_color = Color.BLACK
	if Input.is_action_just_pressed("game_down"):
		var panel = ($KeyB as Node).get("theme_override_styles/panel") 
		panel.bg_color = Color.RED
	if Input.is_action_just_released("game_down"):
		var panel = ($KeyB as Node).get("theme_override_styles/panel") 
		panel.bg_color = Color.BLACK

func set_value(p_value):
	$Panel.value = p_value
	$Panel.queue_redraw()
