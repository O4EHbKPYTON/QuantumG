extends RigidBody2D

@onready var touch_area: Area2D = $Area2D  # Ссылка на Area2D

func _ready() -> void:
	touch_area.body_entered.connect(_on_body_entered)  # Подключаем сигнал

func _on_body_entered(body: CharacterBody2D) -> void:
	if body is CharacterBody2D:  # Проверяем, что это игрок
		print("Игрок тронул коробку!")
		_on_box_touched()

func _on_box_touched() -> void:
	var max_angular_speed: float = 2.0  # Ограничение вращения
	angular_velocity = clamp(angular_velocity, -max_angular_speed, max_angular_speed)
