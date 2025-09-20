extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var character_direction : Vector2
var last_direction := Vector2.DOWN   # default start facing
const SPEED = 100.0
var already_walking_one_direciton := false

func _physics_process(delta: float) -> void:

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	f
	
	character_direction = Vector2( 
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized()
	

		
	if character_direction != Vector2.ZERO:
		last_direction = character_direction
			
	if character_direction != Vector2.ZERO:
		sprite.play(get_walk_anim(character_direction))
		velocity = character_direction * SPEED
	else:
		sprite.play(get_idle_anim(last_direction))
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)	
		
		
	move_and_slide()
	
func get_walk_anim(direction:Vector2):
	if abs(direction.x) > abs(direction.y):
		return "walking_right" if direction.x > 0 else "walking_left"
	else:
		return "walking_down" if direction.y > 0 else "walking_up"

func get_idle_anim(direction:Vector2):
	if abs(direction.x) > abs(direction.y):
		return "idle_staring_right" if direction.x > 0 else "idle_staring_left"
	else:
		return "idle_staring_down" if direction.y > 0 else "idle_staring_up"
