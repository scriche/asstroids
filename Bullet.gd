extends Area2D

@export var bullet_speed : float

func _process(delta: float) -> void:
	position += Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * delta * bullet_speed
	
func _on_timer_timeout() -> void:
	queue_free()
