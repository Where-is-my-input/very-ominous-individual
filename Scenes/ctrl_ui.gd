extends Control

@onready var lbl_player_health = $lblPlayerHealth
@onready var pb_health = $pbHealth
@onready var pb_dash_cd = $pbDashCD
@onready var pb_jump_cd = $pbJumpCD

func _ready():
	if Stats.newGame > 0:
		pb_dash_cd.visible = true
	else:
		pb_dash_cd.visible = false
	Stats.connect("healthChanged", update)
	Stats.connect("setMaxHealth", setMaxValue)
	Stats.connect("dashCd", updateDash)
	Stats.connect("jumpCd", updateJump)
	Stats.connect("dashCollected", dashCollected)

func update(v):
	#lbl_player_health.text = str(v)
	pb_health.value = v

func setMaxValue(v):
	pb_health.max_value = v

func updateDash(v):
	pb_dash_cd.value = v

func updateJump(v):
	pb_jump_cd.value = v

func dashCollected():
		pb_dash_cd.visible = true
