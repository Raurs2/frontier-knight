extends Control
class_name DialogBox

@onready var rich_text_label: RichTextLabel = $TextureRect/RichTextLabel
@onready var next_indicator: ColorRect = $TextureRect/NextIndicator

@export_multiline var messages:Array[String] = []

var dialog_index = 0
var is_dialog_started = false
var first_dialog = true
var is_speaking = false
var tween: Tween

signal dialog_running
signal dialog_finished

func _ready() -> void:
	load_dialog()

# Update the dialogue state, when a dialogue begin it will  unhide the dialogue box,
# And when the player clicks the action button it will skip dialogue animation or
# skip to the next dialogue
func _process(_delta: float) -> void:
	if is_dialog_started and first_dialog:
		visible = true
		load_dialog()
		first_dialog = false
	elif is_dialog_started:
		emit_signal("dialog_running")
		next_indicator.visible = not is_speaking
		
		if Input.is_action_just_pressed('action'):
			if is_speaking:
				finish_text_animation()
			else:
				load_dialog()

# It will run while there is dialogue or it's not an '-END-' string
func load_dialog():
	if dialog_index < messages.size() and messages[dialog_index] != '-END-':
		rich_text_label.text = messages[dialog_index]
		rich_text_label.visible_ratio = 0
		var len_text = rich_text_label.text.length()
		var text_speed = len_text * 0.018
		
		if tween and tween.is_running():
			tween.kill()
			
		# Animate dialogue 
		tween = get_tree().create_tween()
		tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tween.tween_property(rich_text_label, 'visible_ratio', 1, text_speed)
		tween.tween_callback(on_text_finished) # Call function in order to skip animation
		
		is_speaking = true
		dialog_index += 1
	else:
		first_dialog = true
		is_dialog_started = false
		emit_signal("dialog_finished")
		visible = false

func on_text_finished():
	is_speaking = false

# Skip animation and show complete text
func finish_text_animation():
	if tween and tween.is_running():
		tween.kill()
	rich_text_label.visible_ratio = 1
	is_speaking = false
