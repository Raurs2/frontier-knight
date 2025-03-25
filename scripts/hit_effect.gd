extends Node

class_name HitEffect

var hit_effects = {
	1 : preload("res://assets/sounds/hit-flesh-02-266309.mp3"),
	2 : preload("res://assets/sounds/hit-flesh-01-266311.mp3"),
	3 : preload("res://assets/sounds/flesh-impact-266316.mp3")
}
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	randomize()

# Play random hit sound effect
func play_audio():
	var play_toaudio = hit_effects[randi_range(1, 3)]
	audio_stream_player.stream = play_toaudio
	audio_stream_player.play()
