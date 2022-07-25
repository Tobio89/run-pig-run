extends Node2D

onready var scoreNum = $ScoreNum

var score := 0
var appleVal = 10

func _ready():
	pass

func update_score_label(newVal):
	scoreNum.text = String(newVal)

func increase_score():
	score += appleVal
	update_score_label(score)