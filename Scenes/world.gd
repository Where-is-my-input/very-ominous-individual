extends Node2D

@onready var player = $Player
@onready var world_1 = $World1
@onready var world_2 = $world2
@onready var world_3 = $world3
@onready var world_4 = $world4
@onready var world_5 = $world5
@onready var world_6 = $world6
@onready var world_7 = $World7
@onready var world_8 = $world8

@onready var camera_2d = $Camera2D
@onready var audio_stream_player = $background/AudioStreamPlayer
@onready var tmr_checkpoint = $tmrCheckpoint

const WORLD_1 = preload("res://Scenes/world_1.tscn")
const WORLD_2 = preload("res://Scenes/world_2.tscn")
const WORLD_3 = preload("res://Scenes/world_3.tscn")
const WORLD_4 = preload("res://Scenes/world_4.tscn")
const WORLD_5 = preload("res://Scenes/world_5.tscn")
const WORLD_6 = preload("res://Scenes/world_6.tscn")
const WORLD_7 = preload("res://Scenes/world_7.tscn")
const WORLD_8 = preload("res://Scenes/world_8.tscn")
const ENDLESS_VOID_LOOP = preload("res://SoundTracks/endless_void_loop.wav")
var checkPoint: Vector2 = Vector2(0,0)
var checkpointCount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Stats.time = 0
	Stats.deaths = 0
	Stats.collected = 0
	Stats.flDashCollected = false
	Stats.flJumpCollected = false
	Stats.light1 = true
	Stats.light2 = true
	Stats.light3 = true
	Stats.light4 = true
	checkPoint = player.global_position
	Stats.connect("checkpoint", setCheckPoint)
	Stats.connect("load", loadWorld)
	Stats.connect("unload", unloadWorld)
	Stats.connect("setBoundaries", setCameraBoundariesi)
	Stats.connect("death", death)
	Stats.connect("gameOver", gameOver)
	playST(ENDLESS_VOID_LOOP)
	setCameraBoundaries(world_1)
	unloadWorlds()

func gameOver():
	Stats.newGame += 1
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func unloadWorlds():
	world_2.queue_free()
	world_3.queue_free()
	world_4.queue_free()
	world_5.queue_free()
	world_6.queue_free()
	world_7.queue_free()
	world_8.queue_free()

func _on_btn_reset_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func setCheckPoint(v, w):
	checkPoint = v

func _input(event):
	if(event.is_action_pressed("respawn") && Stats.newGame > 0):
		tmr_checkpoint.start(15)
		checkpointCount += 1
		if checkpointCount > 1:
			Stats.respawn.emit()
		player.respawn(checkPoint)

func death():
	Stats.deaths += 1
	player.respawn(checkPoint)

func playST(st):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -15)
	audio_stream_player.stream = st
	audio_stream_player.play()

func loadWorld(i):
	match i:
		1: 
			if world_1 == null:
				world_1 = WORLD_1.instantiate()
				world_1.global_position = Vector2(-896, 0)
				self.add_child(world_1)
		2: 
			if world_2 == null:
				world_2 = WORLD_2.instantiate()
				world_2.global_position = Vector2(4692, 414)
				self.add_child(world_2)
		3: 
			if world_3 == null:
				world_3 = WORLD_3.instantiate()
				world_3.global_position = Vector2(7798, -828)
				self.add_child(world_3)
		4: 
			if world_4 == null:
				world_4 = WORLD_4.instantiate()
				world_4.global_position = Vector2(9112, -2001)
				self.add_child(world_4)
		5: 
			if world_5 == null:
				world_5 = WORLD_5.instantiate()
				world_5.global_position = Vector2(7798, -1725)
				self.add_child(world_5)
		6: 
			if world_6 == null:
				world_6 = WORLD_6.instantiate()
				world_6.global_position = Vector2(3933, -690)
				self.add_child(world_6)
		7: 
			if world_7 == null:
				world_7 = WORLD_7.instantiate()
				world_7.global_position = Vector2(7797, 345)
				self.add_child(world_7)
		8: 
			if world_8 == null:
				world_8 = WORLD_8.instantiate()
				world_8.global_position = Vector2(7797, 0)
				self.add_child(world_8)

func unloadWorld(i):
	match i:
		1: 
			if world_1 != null:
				world_1.queue_free()
		2: 
			if world_2 != null:
				world_2.queue_free()
		3: 
			if world_3 != null:
				world_3.queue_free()
		4: 
			if world_4 != null:
				world_4.queue_free()
		5: 
			if world_5 != null:
				world_5.queue_free()
		6: 
			if world_6 != null:
				world_6.queue_free()
		7: 
			if world_7 != null:
				world_7.queue_free()
		8: 
			if world_8 != null:
				world_8.queue_free()

func setCameraBoundaries(newWorld):
	player.set_camera_limits(newWorld.returnTileMap(), camera_2d, newWorld.global_position)

func setCameraBoundariesi(i):
	match i:
		1: 
			if world_1 != null:
				player.set_camera_limits(world_1.returnTileMap(), camera_2d, world_1.global_position)
		2: 
			if world_2 != null:
				player.set_camera_limits(world_2.returnTileMap(), camera_2d, world_2.global_position)
		3: 
			if world_3 != null:
				player.set_camera_limits(world_3.returnTileMap(), camera_2d, world_3.global_position)
		4: 
			if world_4 != null:
				player.set_camera_limits(world_4.returnTileMap(), camera_2d, world_4.global_position)
		5: 
			if world_5 != null:
				player.set_camera_limits(world_5.returnTileMap(), camera_2d, world_5.global_position)
		6: 
			if world_6 != null:
				player.set_camera_limits(world_6.returnTileMap(), camera_2d, world_6.global_position)
		7: 
			if world_7 != null:
				player.set_camera_limits(world_7.returnTileMap(), camera_2d, world_7.global_position)
		8: 
			if world_8 != null:
				player.set_camera_limits(world_8.returnTileMap(), camera_2d, world_8.global_position)


func _on_tmr_checkpoint_timeout():
	checkpointCount = 0


func _on_audio_stream_player_finished():
	playST(ENDLESS_VOID_LOOP)
