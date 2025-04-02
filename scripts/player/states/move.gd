extends State

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed('JUMP') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	if not is_instance_valid(parent):
		return null
	
	parent.velocity.y += gravity * delta
	
	var left_pressed: float = Input.is_action_pressed("MOVE_LEFT")
	var right_pressed: float = Input.is_action_pressed("MOVE_RIGHT")
	
	if left_pressed and right_pressed:
		if Input.is_action_just_pressed("MOVE_LEFT"):
			parent.velocity.x = -move_speed
			parent.animations.flip_h = true
		elif Input.is_action_just_pressed("MOVE_RIGHT"):
			parent.velocity.x = move_speed
			parent.animations.flip_h = false
	elif left_pressed:
		parent.velocity.x = -move_speed
		parent.animations.flip_h = true
	elif right_pressed:
		parent.velocity.x = move_speed
		parent.animations.flip_h = false
	else:
		parent.velocity.x = 0
	
	var __ : bool = parent.move_and_slide()
	
	if not parent.is_on_floor():
		return fall_state
	if parent.velocity.x == 0:
		return idle_state
	
	return null
