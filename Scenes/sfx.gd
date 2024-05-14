extends Node
@onready var sfx_burning = $sfxBurning
@onready var sfx_dash = $sfxDash

func dash():
	sfx_dash.play()
