extends Area2D

func _ready() -> void:
	var viewportInfo : Rect2 = get_viewport().get_visible_rect()
	var middlevec =  (viewportInfo.end+viewportInfo.position)/2 - position
	var randscale = randf_range(0.5,1.3*Global.diff)
	rotation = randf_range(-PI/3,PI/3) + atan2(middlevec.y,middlevec.x)
	scale = Vector2(randscale, randscale) 

func _process(delta: float) -> void:
	position += Vector2(cos(rotation), sin(rotation))*delta*60*Global.diff
