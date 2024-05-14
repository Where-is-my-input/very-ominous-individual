extends Node2D

@onready var player = $Player
@onready var world_1 = $World1
@onready var camera_2d = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player.set_camera_limits($World1/TileMap, camera_2d)


func _on_btn_reset_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
