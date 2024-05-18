extends CharacterBody2D


var speed = 100.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@export var hp = 5
@export var damage = 75

@export var chaseSpeed = 50
@export var facing = -1

func _ready():
	audio_stream_player_2d.play()
	print(audio_stream_player_2d.get_pitch_scale())

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if facing:
		velocity.x = facing * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	if is_on_wall():
		flip()

func _on_detect_body_entered(body):
	if body.is_in_group("player"):
		speed += chaseSpeed
		audio_stream_player_2d.set_pitch_scale(5)


func _on_detect_body_exited(body):
	if body.is_in_group("player"):
		speed -= chaseSpeed
		audio_stream_player_2d.set_pitch_scale(1)

func getHit(d):
	hp -= d
	if hp <= 0:
		die()

func flip():
	facing *= -1
	scale.x *= -1

func die():
	queue_free()


func _on_hit_body_entered(body):
	if body.is_in_group("player"):
		body.playerGetHit(damage, global_position)


func _on_audio_stream_player_2d_finished():
	audio_stream_player_2d.play()
