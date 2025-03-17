extends Control

@onready var settings: Control = $Settings
@onready var bgm: AudioStreamPlayer = $Bgm

func _ready() -> void:
	bgm.play_audio(3)

func _on_new_game_pressed() -> void:
	ButtonSound.play_click_sound()
	get_tree().change_scene_to_file("res://scenes/prologue.tscn")

func _on_continue_pressed() -> void:
	ButtonSound.play_click_sound()
	SaveManager.load_game()
	get_tree().change_scene_to_file("res://scenes/house.tscn")

func _on_options_pressed() -> void:
	ButtonSound.play_click_sound()
	if settings.is_visible_in_tree():
		settings.visible = false
	else:
		settings.visible = true

func _on_quit_pressed() -> void:
	ButtonSound.play_click_sound()
	get_tree().quit()
