extends Node

@onready var h_box_container = $MarginContainer/CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer
@onready var lbl_percent = $MarginContainer/CenterContainer/HBoxContainer/VBoxContainer2/lblPercent
@onready var lbl_deaths = $MarginContainer/CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer2/lblDeaths
@onready var lbl_time = $MarginContainer/CenterContainer/HBoxContainer/VBoxContainer/lblTime
@onready var new_game_count = $MarginContainer/CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/newGameCount

# Called when the node enters the scene tree for the first time.
func _ready():
	if Stats.newGame > 1:
		h_box_container.visible = true
		new_game_count.text = str(Stats.newGame - 1)
	else:
		h_box_container.visible = false

	lbl_deaths.text = str(Stats.deaths)
	var time = "%02d:" % Stats.hours
	time += "%02d:" % Stats.minutes
	time += "%02d." % Stats.seconds
	time += "%03d" % Stats.msec
	
	if Stats.collected / Stats.maxCollectibles == 1:
		lbl_percent.text = "100%"
	else:
		lbl_percent.text = str("%02d" % ((Stats.collected / Stats.maxCollectibles) * 100), "%")
	
	lbl_time.text = time


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
