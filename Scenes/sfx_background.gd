extends Node
@onready var timer = $Timer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _ready():
	timer.start(randf_range(0,10))



func _on_timer_timeout():
	if !audio_stream_player_2d.playing:
		audio_stream_player_2d.play()
	timer.start(randf_range(0,10))
