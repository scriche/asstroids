extends Area2D

@export var bullet_speed : float

func _process(delta: float) -> void:
	position += Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * delta * bullet_speed
	rotation += clamp(randf_range(-2*PI, 2*PI),PI,3*PI) * delta
	scale += Vector2(4,4) * delta

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area:Area2D):
	if area.is_in_group(("Astroids")):
		area.queue_free()
		queue_free()