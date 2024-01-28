extends Control
class_name EmojiManager

var HAPPY_EMOJIS = [
	"res://resource_remote/Emoji Happy 01.png",
	"res://resource_remote/Emoji Happy 03.png",
	"res://resource_remote/Emoji Happy 04.png",
]

var MEDIUM_EMOJIS = [
	"res://resource_remote/Emoji Happy 02.png",
	"res://resource_remote/Emoji Angry 01.png",
	"res://resource_remote/Emoji Angry 02.png",
]

var ANGRY_EMOJIS = [
	"res://resource_remote/Emoji Angry 03.png",
	"res://resource_remote/Emoji Angry 02.png",
]

@onready var emoji_scene = preload("res://src/ui/ui_game/emoji.tscn")

func _ready():
	generate_emoji()
	$TimerEmoji.timeout.connect(generate_emoji)

func generate_emoji():
	$TimerEmoji.wait_time = randf_range(1, 2)
	var emoji = emoji_scene.instantiate()
	self.add_child(emoji)
	
	if GlobalState.laugh < 33:
		emoji.setup(load(ANGRY_EMOJIS.pick_random()))
	elif GlobalState.laugh < 66:
		emoji.setup(load(MEDIUM_EMOJIS.pick_random()))
	elif GlobalState.laugh <= 100:
		emoji.setup(load(HAPPY_EMOJIS.pick_random()))
