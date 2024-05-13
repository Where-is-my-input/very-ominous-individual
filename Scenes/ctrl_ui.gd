extends Control

@onready var lbl_player_health = $lblPlayerHealth
@onready var pb_health = $pbHealth

func _ready():
	Stats.connect("healthChanged", update)
	Stats.connect("setMaxHealth", setMaxValue)

func update(v):
	#lbl_player_health.text = str(v)
	pb_health.value = v

func setMaxValue(v):
	pb_health.max_value = v
