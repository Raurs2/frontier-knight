extends Area2D
@onready var hit_effect: HitEffect = $HitEffect

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage('sword')
		hit_effect.play_audio()
