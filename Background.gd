extends Sprite2D

func _process(delta):
    position.y += 100 * delta  # Move down at 100 pixels per second
    if position.y >= get_viewport().get_visible_rect().end.y:
        position.y = 0