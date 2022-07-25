extends Area2D

class_name PlayerPig

export var SPEED:int = 100

var BOOST = Globals.RUN_SPEED
var BOOST_TIME = Globals.EAT_TIME

onready var anim := $AnimationPlayer
onready var timer := $XTimer
onready var sprite := $Sprite
onready var scoreCard := $'../ScoreCard'
onready var collision := $Collision
onready var hungerMeter := $'../HungerMeter'

var isMovingX := false
var getBoost := false
var getDelay := false
var isDead := false


func _ready():
	anim.play("Run")
	print(self.position.y)
	
func _process(delta):

	if hungerMeter.outOfTime:
		die()

	if isDead: 
		anim.play("Idle")
		return

	if isMovingX:
		if getBoost:
			move('right', delta)
		else:
			move('left', delta)
	
	else:
		if Input.is_action_pressed("ui_down"):
			move("down", delta)
		elif Input.is_action_pressed("ui_up"):
			move("up", delta)
		
		if Input.is_action_just_pressed("ui_right"):
			delay()
	
	

			
# PIG BEHAVIOUR
func move(dir:String, delta:float):
	
	match dir:
		'up':
			if self.position.y > 10:
				self.position.y -= SPEED * delta
		'down':
			if self.position.y < 170:
				self.position.y += SPEED * delta
		'right':
			if self.position.x < 300:
				self.position.x += BOOST * delta
		'left':	
			# if self.position.x > 50:
			self.position.x -= BOOST * delta

func die():
	sprite.flip_v  = true
	isDead = true
	Globals.GAME_OVER = true

# When an apple reaches the farmer
func boost():
	collision.disabled = true
	if !isMovingX:
		timer.start(BOOST_TIME)
		isMovingX = true
		getBoost = true

# When the pig eats an apple
func delay():
	if !isMovingX:
		timer.start(BOOST_TIME)
		anim.play("Idle")
		isMovingX = true
		getDelay = true


func eat_apple(apple:Apple):
	delay()
	apple.be_eaten()
	scoreCard.increase_score()
	hungerMeter.increase_life()


# Boost / delay time has elapsed
func _on_XTimer_timeout():
	isMovingX = false
	getBoost = false
	getDelay = false

	anim.play("Run")
	collision.disabled = false


# Pig hit an apple
func _on_Pig_area_entered(obj:Area2D):
	var apple = obj as Apple
	if apple:
		if (!apple.isBeingEaten):
			eat_apple(apple)
