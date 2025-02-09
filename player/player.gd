extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -320.0

@onready var animation = $AnimatedSprite2D

func _ready() -> void:
	animation.play("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if (direction < 0):
			animation.set_flip_h(true)
		else: 
			animation.set_flip_h(false)
		animation.play("running")
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")

	move_and_slide()
