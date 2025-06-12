extends Control

var score
var lives

func _ready():
	score = $Score
	lives = $Lives

func _process(_delta):
	score.text = "Score: " + str(Global.score)
	lives.text = "" + str(Global.lives)
	position = Global.viewpos
