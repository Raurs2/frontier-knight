extends Node

@onready var audio_player = AudioStreamPlayer.new()
const OLD_RADIO_BUTTON_CLICK_97549 = preload("res://assets/sounds/old-radio-button-click-97549.mp3")

func _ready():
	add_child(audio_player)
	audio_player.bus = "res://default_bus_layout.tres"

# Mouse click sound when clicking buttons
func play_click_sound():
	audio_player.stream = OLD_RADIO_BUTTON_CLICK_97549
	audio_player.volume_db = -10
	audio_player.play()
	audio_player.seek(0.12)
