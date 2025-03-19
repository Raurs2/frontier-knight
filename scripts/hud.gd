extends Control
class_name Hud

@onready var end_timer: Timer = $EndTimer
@onready var level_end_score: LevelEndScore = $LevelEndScore
@onready var enemies_label: Label = $CenterContainer/HBoxContainer/HBoxContainer/EnemiesLabel
@onready var time_label: Label = $CenterContainer/HBoxContainer/HBoxContainer2/TimeLabel
@onready var money_label: Label = $CenterContainer/HBoxContainer/HBoxContainer3/MoneyLabel

func _process(_delta: float) -> void:
	time_label.text = "%d:%02d" % [floor(end_timer.time_left / 60), int(end_timer.time_left) % 60]
	enemies_label.text = str(SaveManager.stats.kill_count)
	money_label.text = str(SaveManager.stats.coins_earned)

func _on_end_timer_timeout() -> void:
	level_end_score.visible = true
	get_tree().paused = true
