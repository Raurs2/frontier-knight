extends Node

signal esc_pressed

func _input(event: InputEvent) -> void:
	if event.is_action("Escape"):
		esc_pressed.emit()
