extends Area2D

var offset : Vector2 = Vector2(70, 70)
@export var Coin : PackedScene

func _ready() -> void:
	var middlevec =  (Global.viewend+Global.viewpos)/2 - position
	var randscale = randf_range(0.7*Global.diff*scale.x,1.3*Global.diff*scale.x)
	if rotation == 0:
		rotation += atan2(middlevec.y,middlevec.x)
		rotation += randf_range(-PI/3,PI/3)
	scale = Vector2(randscale, randscale) * scale

func _physics_process(delta: float) -> void:
	position += Vector2(cos(rotation), sin(rotation))*delta*60/scale*Global.diff
	if position - offset > Global.viewend or position + offset < Global.viewpos:
		queue_free()

func break_apart() -> void:
	if scale > Vector2(0.6, 0.6):
		var a = self.duplicate()
		var b = self.duplicate()
		a.scale = scale * 0.7 / Global.diff
		b.scale = scale * 0.7 / Global.diff
		a.rotation = rotation + PI/4
		b.rotation = rotation - PI/4
		get_parent().add_child(a)
		get_parent().add_child(b)
	else:
		var c = Coin.instantiate()
		c.position = position
		get_parent().add_child(c)
	queue_free()
