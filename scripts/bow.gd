extends Area2D
@onready var bow: AnimatedSprite2D = $BowPivot/Bow
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer

var audio_charge = preload("res://assets/sounds/bow-loading-38752.mp3")
var speed = SaveManager.stats.player_stats['dex']

func _ready() -> void:
	timer.start(1.0 * 1000 / (1000 + speed))

func _physics_process(_delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	bow.play('shoot')

	const BULLET = preload("res://scenes/arrow.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	get_parent().add_child(new_bullet) 

func _on_timer_timeout() -> void:
	audio_stream_player.stream = audio_charge
	audio_stream_player.play()
	shoot()
