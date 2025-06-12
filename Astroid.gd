extends Area2D

var offset : Vector2 = Vector2(70, 70)

func _ready() -> void:
	var viewportInfo : Rect2 = get_viewport().get_visible_rect()
	var middlevec =  (viewportInfo.end+viewportInfo.position)/2 - position
	var randscale = randf_range(0.5,1.3*Global.diff)
	rotation = randf_range(-PI/3,PI/3) + atan2(middlevec.y,middlevec.x)
	scale = Vector2(randscale, randscale) * scale

func _physics_process(delta: float) -> void:
	position += Vector2(cos(rotation), sin(rotation))*delta*60/scale*Global.diff
	if position - offset > Global.viewend or position + offset < Global.viewpos:
		queue_free()
		print("pop")

func break_apart() -> void:
	var a = self.duplicate()
	var b = self.duplicate()
	owner = get_parent()
	a.position = position + Vector2(cos(rotation), sin(rotation))*10
	b.position = position - Vector2(cos(rotation), sin(rotation))*10
	a.scale = scale * 0.5
	b.scale = scale * 0.5
	owner.add_child(a)
	owner.add_child(b)
	queue_free()
