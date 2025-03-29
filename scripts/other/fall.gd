extends BaseState

@export var move_speed: float = 120
@export var gravity_scale: float = 100 # Множитель гравитации

func physics_process(delta: float) -> int:
	var move: int = 0
	if Input.is_action_pressed("MOVE_LEFT"):
		move = -1
		player.animations.flip_h = true
	elif Input.is_action_pressed("MOVE_RIGHT"):
		move = 1
		player.animations.flip_h = false
	
	player.velocity.x = move * move_speed
	player.velocity.y += player.gravity * delta * gravity_scale
	player.move_and_slide()

	if player.is_on_floor():
		return State.Walk if move != 0 else State.Idle
	return State.Null
