extends Camera2D

@export var player : CharacterBody2D
	
func _physics_process(delta: float) -> void:
	
	position = position.lerp(player.position, delta * 3)
