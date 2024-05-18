extends Node2D

@export var load = 0
@export var unload = 0

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		if load > 0:
			fLoad()
		if unload > 0:
			fUnload()

func fLoad():
	Stats.emit_signal("load", load)

func fUnload():
	Stats.emit_signal("unload", unload)
