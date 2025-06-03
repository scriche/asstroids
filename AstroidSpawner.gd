extends Node2D

@export var Astroid : PackedScene

func _on_timer_timeout() -> void:
	var a = Astroid.instantiate()
	var viewportInfo : Rect2 = get_viewport().get_visible_rect()
	var offset = 70
	match randi_range(0,3): 
		0:
			a.position = Vector2(randf_range(viewportInfo.position.x,viewportInfo.end.x),viewportInfo.position.y-offset)
		1:
			a.position = Vector2(randf_range(viewportInfo.position.x,viewportInfo.end.x),viewportInfo.end.y+offset)
		2:
			a.position = Vector2(viewportInfo.position.x-offset,randf_range(viewportInfo.position.y,viewportInfo.end.y))
		3:
			a.position = Vector2(viewportInfo.end.x+offset,randf_range(viewportInfo.position.y,viewportInfo.end.y))
	owner.add_child(a)
