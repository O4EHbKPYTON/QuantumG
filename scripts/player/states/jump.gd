extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@export var jump_force: float = 700.0

func enter() -> void:
	super()
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	print(gravity)
	if parent.velocity.y > 0:
		return fall_state
	
	var movement: float = Input.get_axis('MOVE_LEFT', 'MOVE_RIGHT') * move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	var __: bool = parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null
