extends CharacterBody2D

const SPEED: float = 425.0
const JUMP_VELOCITY: float = -370.0

@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():  # Гравитация
		velocity.y += get_gravity().y * delta
	if Input.is_action_just_pressed("JUMP") and is_on_floor():  # Прыжок
		velocity.y = JUMP_VELOCITY

	var direction: float = Input.get_axis("MOVE_LEFT", "MOVE_RIGHT")  # Направление движения
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0:
		animated_sprite.flip_h = true

	if is_on_floor(): 
		if direction == 0:
			animated_sprite.play("IDLE")
		else:
			animated_sprite.play("RUN")

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
