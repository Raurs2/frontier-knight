extends Control
class_name LevelEndScore

@onready var killed_label: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/killedLabel
@onready var damage_taken_label: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/damageTakenLabel
@onready var damage_given: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/damageGiven
@onready var coins_earned: Label = $Panel/CenterContainer/VBoxContainer/GridContainer/CoinsEarned
@onready var points_label: Label = $Panel/CenterContainer/VBoxContainer/GridContainer2/PointsLabel

func _process(_delta: float) -> void:
	killed_label.text = str(SaveManager.stats.kill_count)
	damage_given.text = str(SaveManager.stats.damage_given)
	damage_taken_label.text = str(round(SaveManager.stats.damage_taken))
	coins_earned.text = str(SaveManager.stats.coins_earned)

func _on_button_pressed() -> void:
	# restore player hp
	SaveManager.stats.player_stats['hp'] = SaveManager.stats.player_stats["max_hp"]
	
	# Add earned gold to player gold
	SaveManager.stats.add_gold(SaveManager.stats.coins_earned)
	
	# resets level run stats
	SaveManager.stats.coins_earned = 0
	SaveManager.stats.kill_count = 0
	SaveManager.stats.damage_given = 0
	SaveManager.stats.damage_taken = 0
	
	# Slimes gets a little stronger for the next run
	SaveManager.stats.slime_stats['def'] += 1
	SaveManager.stats.slime_stats['dmg'] += 1.0
	SaveManager.stats.slime_stats['hp'] += 1
	SaveManager.stats.slime_stats['spd'] += 1
	
	# Globins gets a little stronger for the next run
	SaveManager.stats.globin_stats['def'] += 1
	SaveManager.stats.globin_stats['dmg'] += 1.0
	SaveManager.stats.globin_stats['hp'] += 1
	SaveManager.stats.globin_stats['spd'] += 1
	
	# if its the first time playing shows prologue
	if not SaveManager.stats.events['Tutorial']:
		get_tree().change_scene_to_file("res://scenes/prologue2.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/house.tscn")
