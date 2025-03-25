extends Node2D

# Slime animations
# Walking animation
func play_walk():
	%AnimationPlayer.play("walk")
# Hurt animation
func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
