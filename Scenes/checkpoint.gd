extends Node2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D

func _ready():
	Stats.connect("checkpoint", enable)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		var parent = get_parent()
		Stats.checkpoint.emit(body.global_position, parent.world)
		collision_shape_2d.set_deferred("disabled", true)

func enable(v, w):
	collision_shape_2d.set_deferred("disabled", false)
