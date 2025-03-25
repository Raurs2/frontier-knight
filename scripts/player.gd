extends CharacterBody2D

signal health_depleted

@onready var sword_pivot: Marker2D = $SwordPivot
@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var hit_box_collision: CollisionShape2D = $HitBox/HitBoxCollision
@onready var timer: Timer = $Timer
@onready var health_bar: ProgressBar = $HealthBar
@onready var hit_box: Area2D = $HitBox
@onready var health_regen: Timer = $HealthRegen

const FADE = 0.5
const ROTATION_SPEED = 5

var health = SaveManager.stats.player_stats['hp']
var speed = 430 * (1000 + SaveManager.stats.player_stats['spd']) / 1000 
var shield = SaveManager.stats.player_stats['def'] / 2.0

# starts slowing hiding health bar
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(health_bar, 'modulate', Color(1, 1, 1, 0), FADE * 8)


func _physics_process(delta: float) -> void:
	# Movement of the player
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	# Update health bar value
	health_bar.value = health
	
	# Define sword rotation
	sword_pivot.rotation += delta * ROTATION_SPEED
	
	# To flip the player sprite depending on facing direction
	if direction.x < 0:
		player_sprite.flip_h = false
	elif direction.x > 0:
		player_sprite.flip_h = true
	
	# Set animation and collision box of the player depending on their movement
	if velocity.length() > 0.0:
		player_sprite.play('walk')
		collision_shape_2d.position = Vector2(2, -46)
		hit_box_collision.position = Vector2(2, -46)
	else:
		player_sprite.play('idle')
		collision_shape_2d.position = Vector2(0, -48)
		hit_box_collision.position = Vector2(0, -48)
	
	# calculates the damage received by the enemies	
	var slime_dmg = SaveManager.stats.slime_stats['dmg']
	var overlapping_mobs = hit_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		timer.start(3) # after 3 seconds without damage regen health
		var tween = create_tween()
		tween.tween_property(health_bar, 'modulate', Color(1, 1, 1, 1), FADE)
		
		var dmg_taken = slime_dmg * overlapping_mobs.size() * delta * 100 / (100 + shield)
		health -= dmg_taken
		
		SaveManager.stats.damage_taken += dmg_taken
		health_bar.value = health
		
		# emmiting players death
		if health <= 0.0:
			health_depleted.emit()

# Will regenerate health after every one second
func _on_timer_timeout() -> void:
	health_regen.start(1)

# while health is not full it will regenerate it each second 
# and afterwards it will stops regenerating and fade out the health bar
func _on_health_regen_timeout() -> void:
	if health < SaveManager.stats.max_health:
		health += SaveManager.stats.player_stats['regen']
		health_bar.value = health
		health_regen.start() 
	else:
		health_regen.stop()
		var tween = create_tween()
		tween.tween_property(health_bar, 'modulate', Color(1, 1, 1, 0), FADE)
