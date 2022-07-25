extends Node2D

onready var bar = $Bar
onready var timer = $LifeTimer

var life := 10

var outOfTime := false

func _ready():
	set_bar_length()
	reset_timer()

func set_bar_length():
	bar.rect_size.x = life*10

func reduce_life():
	life -= 1
	set_bar_length()

func increase_life():
	if life < 10:
		life = 10
		set_bar_length()
	reset_timer()

func reset_timer():
	timer.start(1)

func _on_LifeTimer_timeout():
	reduce_life()
	if life > 0:
		reset_timer()
	else:
		outOfTime = true
	

