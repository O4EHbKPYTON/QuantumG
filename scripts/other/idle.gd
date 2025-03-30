extends BaseState

func input(event: InputEvent) -> int:
	if Input.is_action_just_pressed("MOVE_LEFT") or Input.is_action_just_pressed("MOVE_RIGHT"):
		return State.Walk
	elif Input.is_action_just_pressed("JUMP"):
		return State.Jump
	return State.Null

func physics_process(delta: float) -> int:
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	if !player.is_on_floor():
		return State.Fall
	return State.Null
