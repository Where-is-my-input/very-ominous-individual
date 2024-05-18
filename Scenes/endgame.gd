extends Node2D
@onready var light_1 = $Light1
@onready var light_2 = $Light2
@onready var light_3 = $Light3
@onready var light_4 = $Light4


# Called when the node enters the scene tree for the first time.
func _ready():
	light_1.state = Stats.light1
	light_2.state = Stats.light2
	light_3.state = Stats.light3
	light_4.state = Stats.light4
	
	light_1.setLightState()
	light_2.setLightState()
	light_3.setLightState()
	light_4.setLightState()
