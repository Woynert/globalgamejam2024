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
}

var AUDIO_PATH = {
	AUDIO.LOOP_CIRCUS_AMBIENT_1: "res://resource_remote/audio/Circus Ambient 1.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_CUERDA: "res://resource_remote/audio/Escena Circus Cuerda.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_INTRO: "res://resource_remote/audio/Escena Circus Intro.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_PLAYFUL: "res://resource_remote/audio/Escena Circus Playful.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_TIBURONES: "res://resource_remote/audio/Escena Circus Tiburones.mp3",
	AUDIO.LOOP_CIRCUS_AMBIENT_TROMPETA: "res://resource_remote/audio/Escena Trompeta Circus.mp3",
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
	player.stream = stream
	player.play()
