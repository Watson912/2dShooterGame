extends Camera2D

@export_category("Camera Smoothing 2.0")
@export var player : CharacterBody2D

@export_category("Camera Smoothing enable")
@export var smoothing_enabled : bool
@export_range(1, 10) var smoothing_scale := 0
var weight :  float

func _ready():
	weight = float(11 - smoothing_scale) / 100
	
func _physics_process(delta: float) -> void:
	
	if player != null:
		var camera_position : Vector2
		
		if smoothing_enabled:
			camera_position = lerp(global_position, player.global_position, weight)
		else:
			camera_position = player.global_position
		
		global_position = camera_position.floor()
