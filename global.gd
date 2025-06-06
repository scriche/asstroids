extends Node

var score : int = 0
var diff : float = 1.0

func _process(_delta):
    diff = 1 + Time.get_ticks_msec()/1000.0/300.0

func set_score(new_score: int) -> void:
    score = new_score