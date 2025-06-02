extends Node2D

@export var Astroid : PackedScene

func _on_timer_timeout() -> void:
	var a = Astroid.instantiate()
	var viewportInfo : Rect2 = get_viewport().get_visible_rect()
	match randi_range(0,3): 
		0:
			a.position = Vector2(randi_range(viewportInfo.position.x,viewportInfo.end.x),viewportInfo.position.y)
		1:
			a.position = Vector2(randi_range(viewportInfo.position.x,viewportInfo.end.x),viewportInfo.end.y)
		2:
			a.position = Vector2(viewportInfo.position.x,randi_range(viewportInfo.position.y,viewportInfo.end.y))
		3:
			a.position = Vector2(viewportInfo.end.x,randi_range(viewportInfo.position.y,viewportInfo.end.y))
	owner.add_child(a)
