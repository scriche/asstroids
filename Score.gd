extends RichTextLabel

func _process(_delta):
    text = "Score: " + str(Global.score)
    position = get_viewport().get_visible_rect().position