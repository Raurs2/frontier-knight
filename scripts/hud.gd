extends Control
class_name Hud

@onready var enemies_label: Label = $CenterContainer/HBoxContainer/EnemiesLabel
@onready var time_label: Label = $CenterContainer/HBoxContainer/TimeLabel
@onready var money_label: Label = $CenterContainer/HBoxContainer/MoneyLabel
@onready var end_timer: Timer = $EndTimer
@onready var level_end_score: LevelEndScore = $LevelEndScore


func _process(delta: float) -> void:
	show_stats()

func show_stats():
	time_label.text = "%d:%02d" % [floor(end_timer.time_left / 60), int(end_timer.time_left) % 60]
	enemies_label.text = str(SaveManager.stats.kill_count)
	money_label.text = str(SaveManager.stats.gold)



func _on_end_timer_timeout() -> void:
	level_end_score.visible = true
	get_tree().paused = true
