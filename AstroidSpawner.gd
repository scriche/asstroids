extends Node2D

@export var Astroid : PackedScene

func _on_timer_timeout() -> void:
	var a = Astroid.instantiate()
	var offset = 70
	match randi_range(0,3): 
		0:
			a.position = Vector2(randf_range(Global.viewpos.x,Global.viewend.x),Global.viewpos.y-offset)
		1:
			a.position = Vector2(randf_range(Global.viewpos.x,Global.viewend.x),Global.viewend.y+offset)
		2:
			a.position = Vector2(Global.viewpos.x-offset,randf_range(Global.viewpos.y,Global.viewend.y))
		3:
			a.position = Vector2(Global.viewend.x+offset,randf_range(Global.viewpos.y,Global.viewend.y))
	owner.add_child(a)
