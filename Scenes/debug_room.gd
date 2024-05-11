extends Node2D

@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D

func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
	#light_occluder_2d.draw_polygon(collision_polygon_2d.polygon)


func _on_reset_pressed():
	get_tree().change_scene_to_file("res://Scenes/debug_room.tscn")
