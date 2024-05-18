extends RigidBody2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var hitbox = $Area2D/hitbox

@export var damage = 5
@export var minSpeed = 15

var spawnPosition
var player = null
var held = false

func _ready():
	Stats.connect("respawn", respawn)
	spawnPosition = global_position

func _physics_process(_delta):
	if (abs(linear_velocity.x) > minSpeed or abs(linear_velocity.y) > minSpeed) && !held:
		hitbox.set_deferred("disabled", false)
	elif !hitbox.disabled:
		hitbox.set_deferred("disabled", true)
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

func respawn():
	global_position = spawnPosition


func _on_area_2d_body_entered(body):
	if body.has_method("getHit"):
		body.getHit(damage)
