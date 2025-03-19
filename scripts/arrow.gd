extends Area2D

var travelled_distance = 0
@onready var hit_effect: HitEffect = $HitEffect
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage('bow')
		hit_effect.play_audio()
		visible = false
		collision_shape_2d.set_deferred('disabled', true)
		await get_tree().create_timer(0.3).timeout
		
	queue_free()
