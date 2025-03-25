extends Area2D
@onready var hit_effect: HitEffect = $HitEffect

# When sword hits enemy call function to calculate damage and play hit effect
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage('sword')
		hit_effect.play_audio()
