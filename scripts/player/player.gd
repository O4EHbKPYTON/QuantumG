class_name Player
extends CharacterBody2D


@onready var animations: AnimatedSprite2D = %animations
@onready var state_machine: StateMachine = $state_machine

func _ready() -> void:
	if not state_machine:
		return
		
	if not state_machine.starting_state:
		return
		
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
