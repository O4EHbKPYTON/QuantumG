extends State

@export var fall_state: State
@export var jump_state: State
@export var move_state: State

@onready var animations: AnimatedSprite2D = %animations

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed('JUMP') and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('MOVE_LEFT') or Input.is_action_just_pressed('MOVE_RIGHT'):
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	var __ : bool = parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
