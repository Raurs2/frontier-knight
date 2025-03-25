extends CPUParticles2D

# Particle effects when enemies dies
func _ready() -> void:
	emitting = true
	var tween = create_tween()
	tween.tween_property(self, 'modulate:a', 0.0, lifetime)
	await get_tree().create_timer(lifetime).timeout
	queue_free()
