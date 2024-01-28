extends Node
class_name TRICKS

enum VAR {
	JUGGLE_BASTON,
	JUGGLE_ANTORCHA,
	JUGGLE_CUCHILLO,
	MONOCYCLE,
	CAKE,
	ROPE,
}

const NAMES = {
	VAR.JUGGLE_BASTON: "Baston",
	VAR.JUGGLE_ANTORCHA: "Antorcha",
	VAR.JUGGLE_CUCHILLO: "Cuchillo",
	VAR.MONOCYCLE: "Monocyclo",
	VAR.CAKE: "Cake Shots",
	VAR.ROPE: "Tightrope",
}

const IMAGE_RESOURCE = {
	VAR.JUGGLE_BASTON: preload("res://resource_remote/Baston.png"),
	VAR.JUGGLE_ANTORCHA: preload("res://resource_remote/Baston fuego.png"),
	VAR.JUGGLE_CUCHILLO: preload("res://resource_remote/Hacha.png"),
	VAR.MONOCYCLE: preload("res://resource_remote/Monociclo.png"),
	VAR.CAKE: preload("res://resource_remote/Cannon.png"),
	VAR.ROPE: preload("res://resource_remote/Simbolo cuerda floja.png"),
}

# by mecanic

const HANDEABLE = [
	VAR.JUGGLE_BASTON,
	VAR.JUGGLE_ANTORCHA,
	VAR.JUGGLE_CUCHILLO,
]

const MOUNTABLE = [
	VAR.MONOCYCLE,
]

const ON_SITE = [
	VAR.ROPE,
	VAR.CAKE,
]

# by difficulty

const EASY_TRICKS = [
	VAR.JUGGLE_BASTON,
]

const MEDIUM_TRICKS = [
	VAR.JUGGLE_ANTORCHA,
	VAR.MONOCYCLE,
	VAR.CAKE,
]

const HARD_TRICKS = [
	VAR.JUGGLE_CUCHILLO,
	VAR.ROPE,
]
