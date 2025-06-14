extends Node

var score : int = 0
var diff : float = 1.0
var lives : int = 1
var viewpos : Vector2
var viewend : Vector2
var playerpos : Vector2


func _process(_delta):
    diff = 1 + Time.get_ticks_msec()/1000.0/300.0
    viewpos = get_viewport().get_visible_rect().get_center() - get_viewport().get_visible_rect().size * 0.5 / (1/diff)
    viewend = get_viewport().get_visible_rect().get_center() + get_viewport().get_visible_rect().size * 0.5 / (1/diff)

func set_score(new_score: int) -> void:
    score = new_score
	
func set_lives(new_lives: int) -> void:
    lives = new_lives

func set_playerpos(new_playerpos: Vector2) -> void:
    playerpos = new_playerpos
