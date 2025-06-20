extends Area2D

var magnet: bool = false

func _physics_process(delta):
    if magnet:
            var direction = (Global.playerpos - position).normalized()
            position += direction * delta * 1000
func _on_area_entered(area:Area2D):
    if area.is_in_group(("Player")):
        magnet = true