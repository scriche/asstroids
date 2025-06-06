extends Area2D

@export var bullet_speed : float

func _process(delta: float) -> void:
	position += Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * delta * bullet_speed

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area:Area2D):
	if area.is_in_group(("Astroids")):
		Global.set_score(Global.score + 1)
		area.queue_free()
		queue_free()