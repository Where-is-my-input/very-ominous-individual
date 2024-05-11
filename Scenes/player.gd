extends CharacterBody2D

@onready var sfx = $sfx
@onready var light_detection = $SubViewport/LightDetection
@onready var sub_viewport = $SubViewport
@onready var camera_2d = $SubViewport/LightDetection/Camera2D
#@onready var color_rect = $SubViewport/LightDetection/ColorRect
@onready var texture_rect = $SubViewport/LightDetection/TextureRect

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var push_force = 80
var isLit = false

var health = 100
var maxHealth = 250

func _ready():
	sub_viewport.debug_draw = 2
	sub_viewport.world_2d = get_tree().root.world_2d

func _process(delta):
	
	#camera_2d.global_transform.origin = global_position
	#Light detection
	light_detection.global_position = global_position
	var texture = sub_viewport.get_texture()
	texture_rect.texture = texture
	var color = get_average_color(texture)
	isLit = color.get_luminance() == 1
	#print(isLit)
	if isLit:
		#sfx.playBurning(health)
		getHurt(1)
	elif health < maxHealth:
		#sfx.stopBurning()
		heal(1)

func heal(v):
	health += 1
	Stats.emit_signal("healthChanged", health)

func getHurt(value):
	health -= 1
	Stats.emit_signal("healthChanged", health)
	if health <= 0:
		die()

func die():
	queue_free()

func get_average_color(texture):
	var image = texture.get_image()
	image.resize(1,1, Image.INTERPOLATE_LANCZOS)
	return image.get_pixel(0,0)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
