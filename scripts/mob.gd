extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("Players").get_child(0)

const MAX_HEALTH = 80
const DAMAGE_GIVEN = 15

var bow_damage = SaveManager.stats.player_stats['dex']
var sword_damage = SaveManager.stats.player_stats['str']
var speed
func _ready() -> void:
	%Slime.play_walk()
	randomize()
	%Slime.modulate = Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	speed = randf_range(280.0, 320.0)
var health = MAX_HEALTH

func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	
	move_and_slide()

func take_damage(weapon: String):
	if weapon == 'bow':
		health -= bow_damage
	if weapon == 'sword':
		health -= sword_damage
	SaveManager.stats.damage_given += DAMAGE_GIVEN
	%Slime.play_hurt()
	
	if health <= 0:
		queue_free()
		const SMOKE_EXPLOSION = preload("res://scenes/DeathEffect.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		SaveManager.stats.kill_count += 1
		SaveManager.stats.coins_earned += 2
