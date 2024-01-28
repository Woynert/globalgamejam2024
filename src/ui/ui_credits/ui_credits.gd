extends Control

func _ready():
	$MarginContainer/Button.pressed.connect(_on_return)

func _on_return():
	SharedRes.get_manager_events().event_goto_main_menu()
