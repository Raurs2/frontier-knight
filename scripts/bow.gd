extends Area2D

@onready var bow: AnimatedSprite2D = $BowPivot/Bow
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer

var audio_charge = preload("res://assets/sounds/bow-loading-38752.mp3")
var speed = SaveManager.stats.player_stats['dex']

func _ready() -> void:
	timer.start(1.0 * 1000 / (1000 + speed)) #start shooting timer

# Bow aims at the closest enemy at range
func _physics_process(_delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

# Create an instance of arrow class, for shooting the arrow from the shooting point of the bow 
func shoot():
	bow.play('shoot')

	const ARROW = preload("res://scenes/arrow.tscn")
	var new_arrow = ARROW.instantiate()

	new_arrow.global_position = %ShootingPoint.global_position
	new_arrow.global_rotation = %ShootingPoint.global_rotation

	get_parent().add_child(new_arrow) 

# Play shooting audio and call shoot arrow function
func _on_timer_timeout() -> void:
	audio_stream_player.stream = audio_charge
	audio_stream_player.play()
	shoot()
