extends Node2D

@onready var world_1 = $".."

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		Stats.setBoundaries.emit(world_1.world)
