extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var character_direction : Vector2
var last_direction := Vector2.DOWN   # default start facing
const SPEED = 100.0

func _physics_process(delta: float) -> void:

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	f
	character_direction.x = Input.get_axis("ui_left", "ui_right" )
	character_direction.y = Input.get_axis("ui_up", "ui_down")
		
	if character_direction.x > 0:
		last_direction = Vector2.RIGHT
	elif character_direction.x < 0:
		last_direction = Vector2.LEFT
	
	if character_direction.x > 0:
		sprite.play("walking_right")
		character_direction.y = 0
	elif character_direction.x < 0:
		sprite.play("walking_left")
		character_direction.y = 0
	if character_direction.y > 0:
		sprite.play("walking_down")
		character_direction.x = 0
		last_direction = Vector2.UP
	elif character_direction.y < 0:
		sprite.play("walking_up")
		character_direction.x = 0
		last_direction = Vector2.DOWN
	
	if character_direction:
		velocity.x = character_direction.x * SPEED
		velocity.y = character_direction.y * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if last_direction == Vector2.DOWN and velocity == Vector2.ZERO:
		sprite.play("idle_staring_up")
	elif last_direction == Vector2.UP and velocity == Vector2.ZERO:
		sprite.play("idle_staring_down")
	if last_direction == Vector2.RIGHT and velocity == Vector2.ZERO:
		sprite.play("idle_staring_right")
	if last_direction == Vector2.LEFT and velocity == Vector2.ZERO:
		sprite.play("idle_staring_left")
		
	move_and_slide()
