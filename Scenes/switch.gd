extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@export var light = 1
var state = false

func _ready():
	match light:
		1: setState(!Stats.light1)
		2: setState(!Stats.light2)
		3: setState(!Stats.light3)
		4: setState(!Stats.light4)

func _on_area_2d_area_entered(area):
	if area.is_in_group("grab") && !state:
		Stats.collected += 1
		audio_stream_player_2d.play()
		setState(true)
		match light:
			1: Stats.light1 = false
			2: Stats.light2 = false
			3: Stats.light3 = false
			4: Stats.light4 = false

func setState(v):
	if v:
		animated_sprite_2d.animation = "active"
		state = true
