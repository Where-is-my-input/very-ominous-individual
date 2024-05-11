extends Control

@onready var lbl_player_health = $lblPlayerHealth

func _ready():
	Stats.connect("healthChanged", update)

func update(v):
	lbl_player_health.text = str(v)
