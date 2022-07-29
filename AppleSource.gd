extends Node2D


var Apple = preload("res://Apple.tscn")

var appleCap = Globals.MAX_APPLES
var x = 360
var ran = RandomNumberGenerator.new()

onready var spawnTimer = $SpawnTimer

func _ready():
	spawnTimer.start(1)

func drop_apple():
	var a = Apple.instance()
	var randomY = ran.randi_range(-70, 70)
	var randomX = ran.randi_range(0, 60)
	var spawnPos = Vector2(randomX, randomY) # relative to spawner
	a.position = spawnPos
	add_child(a)

func schedule_spawn():
	var dur = ran.randi_range(1, 7)
	spawnTimer.start(dur)

func _on_SpawnTimer_timeout():
	if !Globals.GAME_OVER:
		if ran.randf_range(0, 1) > 0.9:
			for _i in range(3):
				drop_apple()
		else:
			drop_apple()

		schedule_spawn()
