extends Node
class_name ManagerUI

enum MENU {
	MAIN,
	SETTINGS,
	DAY_RESUME,
	GAME,
	GAME_PAUSE,
	GAME_INFO,
}

@onready var MENU_NODES = {
	MENU.MAIN: preload("res://src/ui/ui_main.tscn"),
	MENU.SETTINGS: null,
	MENU.DAY_RESUME: preload("res://src/ui/ui_day_resume.tscn"),
	MENU.GAME: preload("res://src/ui/ui_game.tscn"),
	MENU.GAME_PAUSE: null,
	MENU.GAME_INFO: null,
}

func unload_all ():
	var children = get_children()
	for child in children:
		child.queue_free()

func show_menu (menu: MENU):
	match menu:
		MENU.GAME:
			unload_all()
	var node_menu = spawn_menu(menu)
	add_child(node_menu)

func spawn_menu (menu: MENU) -> Node:
	var scene: PackedScene = MENU_NODES[menu]
	if !scene:
		printerr("E: Couldn't find scene for menu %d" % menu)
		return null
	return scene.instantiate()
