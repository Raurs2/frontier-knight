extends Node2D
@onready var hud: Hud = $Player/Hud
@onready var dialog_box: DialogBox = $Player/DialogBox
@onready var bgm: Bgm = $Bgm
@onready var settings: Control = $Player/Settings

func _ready() -> void:
	bgm.play_audio(7)
	dialog_box.is_dialog_started = true
	InputManager.esc_pressed.connect(_on_esc_pressed)
	
# Instantiate a new enemy in a random position around player
func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

# spawn mob when timer is over, 
func _on_spawn_timer_timeout() -> void:
	spawn_mob() 

# End the level and show scoreboard when players dies
func _on_player_health_depleted() -> void:
	hud.level_end_score.visible = true
	get_tree().paused = true
	
# Open up settings menu
func _on_esc_pressed():
	ButtonSound.play_click_sound()
	settings.visible = true
	get_tree().paused = true
