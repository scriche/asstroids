extends Area2D

@export var bullet_speed : float

func _physics_process(delta: float) -> void:
	var velocity = Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * bullet_speed
	position += velocity * delta

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area:Area2D):
	if area.is_in_group(("Astroids")):
		area.call_deferred("break_apart")
		queue_free()
