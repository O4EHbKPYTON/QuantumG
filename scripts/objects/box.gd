extends RigidBody2D

func _ready() -> void:
	pass

func _on_body_entered(body: CharacterBody2D) -> void:
	if body is CharacterBody2D:  
		print("Игрок тронул коробку!")
		_on_box_touched()

func _on_box_touched() -> void:
	var max_angular_speed: float = 2.0  
	angular_velocity = clamp(angular_velocity, -max_angular_speed, max_angular_speed)
