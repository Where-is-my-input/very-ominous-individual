extends Node2D

@onready var player = $Player
@onready var world_1 = $World1
@onready var world_2 = $world2
@onready var camera_2d = $Camera2D

var checkPoint: Vector2 = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	Stats.connect("checkpoint", setCheckPoint)
	#player.set_camera_limits($World2/TileMap, camera_2d)
	pass


func _on_btn_reset_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func setCheckPoint(v):
	checkPoint = v

func _input(event):
	if(event.is_action_pressed("respawn")):
		player.respawn(checkPoint)
