extends RigidBody2D
@onready var collision_shape_2d = $CollisionShape2D

var player = null
var held = false

func _physics_process(delta):
	if held && player != null:
		global_transform.origin = player.global_position + Vector2(25 * player.facing,-15)

func grabbed(playerHold):
	set_deferred("freeze", true)
	player = playerHold
	held = true
	collision_shape_2d.set_deferred("disabled", true)

func released():
	held = false
	player = null
	set_deferred("freeze", false)
	collision_shape_2d.set_deferred("disabled", false)
