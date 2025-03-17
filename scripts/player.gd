extends CharacterBody2D

signal health_depleted

@onready var sword_pivot: Marker2D = $SwordPivot
@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var hit_box_collision: CollisionShape2D = $HitBox/HitBoxCollision
@onready var timer: Timer = $Timer
@onready var health_bar: ProgressBar = $HealthBar
@onready var hit_box: Area2D = $HitBox

const FADE = 0.5
const ROTATION_SPEED = 5
var health = SaveManager.stats.player_stats['hp']
var speed = SaveManager.stats.player_stats['spd'] * 55
var shield = SaveManager.stats.player_stats['def'] / 10.0
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property(health_bar, 'modulate', Color(1, 1, 1, 0), FADE * 4)
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	sword_pivot.rotation += delta * ROTATION_SPEED
	
	if direction.x < 0:
		player_sprite.flip_h = false
	elif direction.x > 0:
		player_sprite.flip_h = true
	
	if velocity.length() > 0.0:
		player_sprite.play('walk')
		collision_shape_2d.position = Vector2(2, -46)
		hit_box_collision.position = Vector2(2, -46)
	else:
		player_sprite.play('idle')
		collision_shape_2d.position = Vector2(0, -48)
		hit_box_collision.position = Vector2(0, -48)
		
	const DAMAGE_RATE = 20.0
	var overlapping_mobs = hit_box.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		timer.start(2)
		var tween = create_tween()
		tween.tween_property(health_bar, 'modulate', Color(1, 1, 1, 1), FADE)
		
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta 
		SaveManager.stats.damage_taken += DAMAGE_RATE * overlapping_mobs.size() * delta / shield
		health_bar.value = health
		if health <= 0.0:
			health_depleted.emit()

func _on_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property(health_bar, 'modulate', Color(1, 1, 1, 0), FADE)
