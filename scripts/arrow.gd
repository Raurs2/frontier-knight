extends Area2D

var travelled_distance = 0
@onready var hit_effect: HitEffect = $HitEffect
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# create an arrow with constant SPEED that fly straight from the shooting point of the bow
# if it reaches the max RANGE without hitting an enemy delete the arrow
func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 2200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

# When arrow hits enemy call function to calculate damage, play hit effect and delete the arrow
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage('bow')
		hit_effect.play_audio()
		
		visible = false
		collision_shape_2d.set_deferred('disabled', true)
		await get_tree().create_timer(0.3).timeout
		
	queue_free()
