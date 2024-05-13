extends Node2D

@onready var light_bulb = $LightBulb
@export var state = false

func _ready():
	light_bulb.setLightState(state)

func switch():
	light_bulb.switch()
