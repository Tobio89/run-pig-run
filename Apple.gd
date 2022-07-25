extends Area2D

class_name Apple

onready var timer = $"./EatingTimer"

var SPEED = Globals.RUN_SPEED
var EAT_DURATION = Globals.EAT_TIME - 0.1

var shouldMove = true
var isBeingEaten = false

func _ready():
	pass

func _process(delta):
	if (shouldMove && !Globals.GAME_OVER):
		move(delta)

func be_eaten():
	timer.start(EAT_DURATION)

func be_collected():
	self.shouldMove = false
	self.queue_free()

func move(delta):
	self.position.x -= SPEED * delta

# Eating has finished
func _on_EatingTimer_timeout():
	self.queue_free()
