extends Node

const maxBurningVolume = 0
const minBurningVolume = -10
var burningVolume = -10

@onready var sfx_burning = $sfxBurning

func playBurning(h):
	if !sfx_burning.playing:
		sfx_burning.volume_db = minBurningVolume
		burningVolume = minBurningVolume
		sfx_burning.play()
	else:
		if h < 200:	setBurningVolume(-8)
		if h < 150:	setBurningVolume(-5)
		if h < 100:	setBurningVolume(0)

func stopBurning():
	burningVolume = minBurningVolume
	sfx_burning.stop()

func setBurningVolume(v):
	burningVolume = v
	print(burningVolume)
	if sfx_burning.playing:
		if burningVolume > maxBurningVolume:
			burningVolume = maxBurningVolume
		sfx_burning.volume_db = burningVolume
