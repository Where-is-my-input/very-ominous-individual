extends Node2D

func _ready():
	if Stats.flJumpCollected:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.jumpPowerUp()
		Stats.collected += 1
		Stats.flJumpCollected = true
		queue_free()
