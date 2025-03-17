extends Node

@onready var audio_player = AudioStreamPlayer.new()
const OLD_RADIO_BUTTON_CLICK_97549 = preload("res://assets/sounds/old-radio-button-click-97549.mp3")
const TOY_BUTTON_105724 = preload("res://assets/sounds/toy-button-105724.mp3")
const HOVER_BUTTON_287656 = preload("res://assets/sounds/hover-button-287656.mp3")
func _ready():
	add_child(audio_player)
	audio_player.bus = "res://default_bus_layout.tres"

func play_click_sound():
	audio_player.stream = OLD_RADIO_BUTTON_CLICK_97549
	audio_player.volume_db = -10
	audio_player.play()
	audio_player.seek(0.12)
