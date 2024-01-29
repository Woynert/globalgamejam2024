extends Node
class_name ManagerSound
@onready var player = $AudioStreamPlayer

enum AUDIO {
	LOOP_CIRCUS_AMBIENT_1,
	LOOP_CIRCUS_AMBIENT_CUERDA,
	LOOP_CIRCUS_AMBIENT_INTRO,
	LOOP_CIRCUS_AMBIENT_PLAYFUL,
	LOOP_CIRCUS_AMBIENT_TIBURONES,
	LOOP_CIRCUS_AMBIENT_TROMPETA, # Escena trompeta circus
	LOOP_BAD_ENDING,
	LOOP_BAD_ENDING_POLO,
	LOOP_GOOD_ENDING,
	APLAUSO_DIARIO_1,
	APLAUSO_DIARIO_2,
	APLAUSO_GRUPAL,
	APLAUSA_SARCASTICO,
	NOSE_HONK,
	NOSE_HONK_2,
	THROW,
	TAKE_ITEM,
	CANON_EXPLOSION,
	CAKE_ON_FACE,
	BUU_1,
	BUU_2,
	LONG_FALL,
	KACHIN,
}

var AUDIO_PATH = {
	AUDIO.LOOP_CIRCUS_AMBIENT_1: "res://resource_remote/audio/Circus Ambient 1.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_CUERDA: "res://resource_remote/audio/Escena Circus Cuerda.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_INTRO: "res://resource_remote/audio/Escena Circus Intro.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_PLAYFUL: "res://resource_remote/audio/Escena Circus Playful.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_TIBURONES: "res://resource_remote/audio/Escena Circus Tiburones.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_TROMPETA: "res://resource_remote/audio/Escena Trompeta Circus.mp3",
	AUDIO.LOOP_BAD_ENDING: "res://resource_remote/audio/Final Triste Pobreza.mp3",
	AUDIO.LOOP_BAD_ENDING_POLO: "res://resource_remote/audio/Final Cambio Profesion.mp3",
	AUDIO.LOOP_GOOD_ENDING: "res://resource_remote/audio/Final Willy Boat completo.mp3",
	AUDIO.APLAUSO_DIARIO_1: "res://resource_remote/audio/Aplauso diario 01.mp3",
	AUDIO.APLAUSO_DIARIO_2: "res://resource_remote/audio/Aplauso diario 02.mp3",
	AUDIO.APLAUSO_GRUPAL: "res://resource_remote/audio/Aplauso grupal.mp3",
	AUDIO.APLAUSA_SARCASTICO: "res://resource_remote/audio/Aplauso Sarcastico.mp3",
	AUDIO.NOSE_HONK: "res://resource_remote/audio/Nose Honk 01.mp3",
	AUDIO.NOSE_HONK_2: "res://resource_remote/audio/Nose Honk 02.mp3",
	AUDIO.THROW: "res://resource_remote/audio/Throw.mp3",
	AUDIO.TAKE_ITEM: "res://resource_remote/audio/Tomar objetos.mp3",
	AUDIO.CANON_EXPLOSION: "res://resource_remote/audio/Cannon explosion.mp3",
	AUDIO.CAKE_ON_FACE: "res://resource_remote/audio/Cake on face.mp3",
	AUDIO.BUU_1: "res://resource_remote/audio/Buu 01.mp3",
	AUDIO.BUU_2: "res://resource_remote/audio/Buu 02.mp3",
	AUDIO.LONG_FALL: "res://resource_remote/audio/Caida Alta.mp3",
	AUDIO.KACHIN: "res://resource_remote/audio/Ka-ching.mp3",
}



func play_hit():
	var stream = [
		load("res://resource_remote/audio/Hit 01.mp3"),
		load("res://resource_remote/audio/Hit 02.mp3"),
		load("res://resource_remote/audio/Hit 03.mp3"),
		load("res://resource_remote/audio/Hit 04.mp3"),
		load("res://resource_remote/audio/Hit 05.mp3"),
		load("res://resource_remote/audio/Hit 06.mp3"),
		load("res://resource_remote/audio/Hit 07.mp3"),
		load("res://resource_remote/audio/Hit 08.mp3")
	].pick_random()
	play_raw_stream(stream)

func play_pain():
	var stream = [
		load("res://resource_remote/audio/Dolor 1.mp3"),
		load("res://resource_remote/audio/Dolor 2.mp3"),
		load("res://resource_remote/audio/Dolor 3.mp3"),
		load("res://resource_remote/audio/Dolor 4.mp3"),
		load("res://resource_remote/audio/Dolor 5.mp3"),
		load("res://resource_remote/audio/Dolor 6.mp3"),
		load("res://resource_remote/audio/Caida Alta.mp3"),
	].pick_random()
	play_raw_stream(stream)

func play_raw_stream(stream):
	var player = $one_shot.get_player()
	player.stream = stream
	player.play()

func play_stream(AUDIO):
	var stream = load(AUDIO_PATH[AUDIO])
	if !stream:
		return
	
	var player = $one_shot.get_player()
	player.stream = stream
	player.play()

func play_stream_loop(AUDIO):
	var stream = load(AUDIO_PATH[AUDIO])
	if !stream:
		return
	stream.loop = true
	var player = $AudioStreamPlayer_loop
	if player.stream == stream:
		return
	player.stream = stream
	player.play()

func stop_loop():
	var player = $AudioStreamPlayer_loop
	player.stop()
