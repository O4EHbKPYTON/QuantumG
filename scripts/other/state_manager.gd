class_name StateManager
extends Node

@onready var states: = {
	BaseState.State.Idle: $idle as BaseState,
	BaseState.State.Walk: $walk as BaseState,
	BaseState.State.Fall: $fall as BaseState,
	BaseState.State.Jump: $jump as BaseState,
}

var current_state: BaseState

func change_state(new_state: BaseState.State) -> void:
	if current_state:
		current_state.exit()
	current_state = states.get(new_state)
	current_state.enter()

func init(player: Player) -> void:
	for child in get_children():
		if child is BaseState:
			(child as BaseState).player = player
	change_state(BaseState.State.Idle)

func physics_process(delta: float) -> void:
	if current_state:
		var new_state: BaseState.State = current_state.physics_process(delta)
		if new_state != BaseState.State.Null:
			change_state(new_state)

func input(event: InputEvent) -> void:
	if current_state:
		var new_state: BaseState.State = current_state.input(event)
		if new_state != BaseState.State.Null:
			change_state(new_state)
