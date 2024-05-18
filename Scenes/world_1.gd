extends Node2D
@onready var tile_map = %TileMap

@export var world = 3

func returnTileMap():
	return tile_map
