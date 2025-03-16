extends Node2D

@onready var hud: Hud = $Player/Hud

func _ready() -> void:
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob() 

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob() 


func _on_player_health_depleted() -> void:
	hud.level_end_score.visible = true
	get_tree().paused = true
