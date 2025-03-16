extends Control
class_name DialogBox

@onready var rich_text_label: RichTextLabel = $TextureRect/RichTextLabel
@onready var next_indicator: ColorRect = $TextureRect/NextIndicator

@export_multiline var messages:Array[String] = []

var dialog_index = 0
var is_dialog_started = false
var first_dialog = true

signal dialog_running
signal dialog_finished

func _ready() -> void:
	load_dialog()

func _process(delta: float) -> void:
	if is_dialog_started and first_dialog:
		visible = true
		load_dialog()
		first_dialog = false
		#get_tree().paused = true
	elif is_dialog_started:
		emit_signal("dialog_running")
		next_indicator.visible = not get_tree().get_processed_tweens()
		if Input.is_action_just_pressed('action'):
			load_dialog()


func load_dialog():
	if dialog_index < messages.size() and messages[dialog_index] != '-END-':
		rich_text_label.text = messages[dialog_index]
		rich_text_label.visible_ratio = 0
		
		var tween = get_tree().create_tween()
		tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		tween.tween_property(rich_text_label, 'visible_ratio', 1, 1)
		
		dialog_index += 1
		
	else:
		first_dialog = true
		is_dialog_started = false
		emit_signal("dialog_finished")
		visible = false
		#get_tree().paused = false
		#queue_free()
