extends Control

var scrap
var lives
var timer
var diffdisplay

func _ready():
	scrap = $GridContainer/Scrap
	lives = $GridContainer/Lives
	timer = $Time
	diffdisplay = $Diff

func _process(_delta):
	scrap.text = "" + str(Global.scrap)
	lives.text = "" + str(Global.lives)
	var time = Time.get_ticks_msec() / 1000
	var time_string = "%02d:%02d:%02d" % [(time / 3600), (time % 3600) / 60, (time % 60)]
	timer.text = time_string
	diffdisplay.text = "%.2f" % Global.diff
