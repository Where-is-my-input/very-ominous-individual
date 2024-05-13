extends Node2D

@export var state = false
var defaultState = state
@onready var lights = $lights

func _on_area_2d_body_entered(body):
	if body.is_in_group("switch"):
		switch()

func _on_area_2d_body_exited(body):
	if body.is_in_group("switch"):
		switch()

func switch():
	for i in lights.get_children():
		i.switch()
