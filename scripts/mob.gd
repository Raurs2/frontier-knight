extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Players").get_child(0)

var hp = SaveManager.stats.slime_stats['hp']
var dmg_given = 0
var bow_damage = SaveManager.stats.player_stats['dex']
var sword_damage = SaveManager.stats.player_stats['str']
var speed = SaveManager.stats.slime_stats['spd']
var enemy_def = SaveManager.stats.slime_stats['def']

func _ready() -> void:
	%Slime.play_walk()
	randomize()
	%Slime.modulate = Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	speed = randf_range(speed - 20.0, speed + 20.0)

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func give_damage(damage : int):
	dmg_given = damage * 100 / (100 + enemy_def)
	hp -= dmg_given
	SaveManager.stats.damage_given += dmg_given

func take_damage(weapon: String):
	if weapon == 'bow':
		give_damage(bow_damage)
	if weapon == 'sword':
		give_damage(sword_damage)
	
	%Slime.play_hurt()
	
	if hp <= 0:
		queue_free()

		const SMOKE_EXPLOSION = preload("res://scenes/DeathEffect.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position

		SaveManager.stats.kill_count += 1
		SaveManager.stats.coins_earned += 3
