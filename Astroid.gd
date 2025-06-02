extends Area2D

func _ready() -> void:
	print(position)
	var viewportInfo : Rect2 = get_viewport().get_visible_rect()
	var middlevec = position - (viewportInfo.end+viewportInfo.position)/2
	rotation = randf_range(-PI/8,PI/8) + atan2(middlevec.y,middlevec.x)
	print(atan2(middlevec.y,middlevec.x))

func _process(delta: float) -> void:
	position += Vector2(cos(rotation-PI/2), sin(rotation-PI/2)) * delta * 60
