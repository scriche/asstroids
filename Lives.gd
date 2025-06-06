extends Sprite2D

var original : Node

func _ready() -> void:
	original = $"."
	
func _process(delta: float) -> void:
	for child in get_children():
		child.queue_free()
	for i in range(0,Global.score):
		var copy = original.duplicate()
		copy.position.x + 10
		add_child(copy)
		
		
