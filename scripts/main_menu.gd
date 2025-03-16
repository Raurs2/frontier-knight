extends Control

@onready var settings: Control = $Settings

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/prologue.tscn")

func _on_continue_pressed() -> void:
	SaveManager.load_game()
	get_tree().change_scene_to_file("res://scenes/house.tscn")

func _on_options_pressed() -> void:
	if settings.is_visible_in_tree():
		settings.visible = false
	else:
		settings.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()
