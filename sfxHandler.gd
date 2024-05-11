extends Node

func playSFX(sound, parent):
	if sound != null && parent != null:
		var stream = AudioStreamPlayer2D.new()
		stream.stream = sound
		stream.connect("finished", queue_free)
		parent.add_child(stream)
		stream.play()
