extends MarginContainer
@onready var start_game = %StartGame
@onready var credits = %Credits
@onready var check_button = $CenterContainer/VBoxContainer/CheckButton
@onready var texture_rect_4 = $"../TextureRect4"

func _ready():
	check_button.visible = false
	texture_rect_4.visible = false
	if Stats.newGame > 0:
		check_button.visible = true
		texture_rect_4.visible = true
		#texture_rect_4.modulate = Color(1,1,1, Stats.newGame * 0.1)
	RenderingServer.set_default_clear_color(Color.BLACK)
	start_game.grab_focus()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_credits_pressed():
	pass # Replace with function body.


func _on_check_button_toggled(toggled_on):
	Stats.showTimer = toggled_on
