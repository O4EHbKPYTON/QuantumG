class_name Player
extends CharacterBody2D

var gravity: int = 10

@onready var animations: AnimatedSprite2D = %animations
@onready var state_manager: StateManager = %state_manager as StateManager

func _ready() -> void:
	state_manager.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_manager.input(event)

func _physics_process(delta: float) -> void:
	state_manager.physics_process(delta)
