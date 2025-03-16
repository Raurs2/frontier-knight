extends Control

@onready var background: TextureRect = $background
@onready var dialog_box: DialogBox = $DialogBox

func _ready() -> void:
	get_tree().paused = false
	dialog_box.is_dialog_started = true

func _process(delta: float) -> void:
		
	if dialog_box.dialog_index == 3: #guy
		background.texture = load('res://assets/backgrounds/dialogbox.png')
	elif dialog_box.dialog_index == 4: #monster food
		background.texture = load('res://assets/backgrounds/placeholder-bg.png')
	elif dialog_box.dialog_index == 6: #close monster
		background.texture = load('res://assets/backgrounds/dialogbox.png')
	elif dialog_box.dialog_index == 10: #close monster
		background.texture = load('res://assets/backgrounds/placeholder-bg.png')
		
func _on_dialog_box_dialog_finished() -> void:
	get_tree().change_scene_to_file('res://scenes/house.tscn')
	
