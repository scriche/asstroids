extends Control

var scrap
var lives

func _ready():
	scrap = $Scrap
	lives = $Lives

func _process(_delta):
	scrap.text = "Scrap: " + str(Global.scrap)
	lives.text = "" + str(Global.lives)
