extends Control

const HEROINE = preload("res://assets/prologue/heroine.png")
const BLOOD = preload("res://assets/prologue/blood.png")
const DIRT = preload("res://assets/prologue/dirt.png")
const STARS = preload("res://assets/prologue/stars.png")

@onready var background: TextureRect = $background
@onready var dialog_box: DialogBox = $DialogBox
@onready var bgm: Bgm = $Bgm

func _ready() -> void:
	get_tree().paused = false
	dialog_box.is_dialog_started = true
	bgm.play_audio(1)

# Change background depending on the current dialogue
func _process(_delta: float) -> void:
	if dialog_box.dialog_index == 3: # war
		change_background(BLOOD)
	elif dialog_box.dialog_index == 5:
		change_background(DIRT)
	elif dialog_box.dialog_index == 6:
		change_background(HEROINE)
	elif dialog_box.dialog_index == 10:
		change_background(DIRT)
	elif dialog_box.dialog_index == 11:
		change_background(HEROINE)
	elif dialog_box.dialog_index == 32:
		change_background(STARS)

# Go to house after finishing all the dialogues
func _on_dialog_box_dialog_finished() -> void:
	get_tree().change_scene_to_file('res://scenes/house.tscn')

# Smoothly change background image if receives a new one
func change_background(new_texture: Texture2D) -> void:
	if background.texture == new_texture:
		return  

	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(background, "modulate", Color(1, 1, 1, 0), 0.1)
	await tween.finished

	background.texture = new_texture

	tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(background, "modulate", Color(1, 1, 1, 1), 0.1)
