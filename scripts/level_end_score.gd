extends Control
class_name LevelEndScore

@onready var killed_label: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/killedLabel
@onready var damage_taken_label: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/damageTakenLabel
@onready var damage_given: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/damageGiven
@onready var coins_earned: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/CoinsEarned
@onready var points_label: Label = $Panel/CenterContainer/VBoxContainer/GridContainer2/PointsLabel

func _process(delta: float) -> void:
	show_stats()

func show_stats():
	killed_label.text = str(SaveManager.stats.kill_count)
	damage_given.text = str(SaveManager.stats.damage_given)
	damage_taken_label.text = str(round(SaveManager.stats.damage_taken))
	coins_earned.text = str(SaveManager.stats.coins_earned)
	#points_label.text = str(round(SaveManager.stats.points))
	


func _on_button_pressed() -> void:
	SaveManager.stats.player_stats['hp'] = 100
	SaveManager.stats.add_gold(SaveManager.stats.coins_earned)
	SaveManager.stats.coins_earned = 0
	SaveManager.stats.kill_count = 0
	SaveManager.stats.damage_given = 0
	SaveManager.stats.damage_taken = 0
	if not SaveManager.stats.events['Tutorial']:
		get_tree().change_scene_to_file("res://scenes/prologue2.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/house.tscn")
