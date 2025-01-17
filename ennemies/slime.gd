extends Node2D

const SPEED = 60
var direction = 1

@onready var rayleft = $RayCastLeft
@onready var rayright = $RayCastRight
@onready var animation =$AnimatedSprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction *SPEED * delta
	if rayright.is_colliding():
		direction = -1
		animation.flip_h = true 
	if rayleft.is_colliding():
		direction = 1
		animation.flip_h = false 
	
