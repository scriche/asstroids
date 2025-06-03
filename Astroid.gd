extends Area2D

func _ready() -> void:
	var viewportInfo : Rect2 = get_viewport().get_visible_rect()
	var middlevec =  (viewportInfo.end+viewportInfo.position)/2 - position
	rotation = randf_range(-PI/3,PI/3) + atan2(middlevec.y,middlevec.x)

func _process(delta: float) -> void:
	position += Vector2(cos(rotation), sin(rotation)) * delta * 60
