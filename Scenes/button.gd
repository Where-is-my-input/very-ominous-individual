extends Node2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@export var state = false
var defaultState = state
@onready var lights = $lights
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var platforms = $platforms

func _on_area_2d_body_entered(body):
	if body.is_in_group("switch"):
		switch()
		switchPlatforms()

func _on_area_2d_body_exited(body):
	if body.is_in_group("switch"):
		switch()
		switchPlatforms()

func switch():
	if animated_sprite_2d.animation == "default":
		animated_sprite_2d.animation = "pressed"
	else:
		animated_sprite_2d.animation = "default"
	audio_stream_player_2d.play()
	for i in lights.get_children():
		i.switch()

func switchPlatforms():
	for i in platforms.get_children():
		i.switch()
