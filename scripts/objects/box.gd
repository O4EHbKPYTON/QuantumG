extends RigidBody2D

func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	angular_velocity = 0
	rotation = 0
