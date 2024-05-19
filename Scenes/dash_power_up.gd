extends Node2D

func _ready():
	if Stats.flDashCollected:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.dashPowerUp()
		Stats.collected += 1
		Stats.dashCollected.emit()
		Stats.flDashCollected = true
		queue_free()
