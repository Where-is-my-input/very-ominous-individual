extends Node2D

func _on_reset_pressed():
	get_tree().change_scene_to_file("res://Scenes/debug_room.tscn")
