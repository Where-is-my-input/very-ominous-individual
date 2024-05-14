extends MarginContainer
@onready var start_game = %StartGame
@onready var credits = %Credits

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	start_game.grab_focus()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/world_1.tscn")

func _on_credits_pressed():
	pass # Replace with function body.
