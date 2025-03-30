extends BaseState

@export var move_speed: float = 60

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("JUMP"):
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	if !player.is_on_floor():
		return State.Fall

	var move: int = 0
	if Input.is_action_pressed("MOVE_LEFT"):
		move = -1
		player.animations.flip_h = true
	elif Input.is_action_pressed("MOVE_RIGHT"):
		move = 1
		player.animations.flip_h = false
	
	player.velocity.x = move * move_speed
	player.move_and_slide()
	
	if not player.is_on_floor():
		return State.Fall
	
	if move == 0:
		return State.Idle

	return State.Null
