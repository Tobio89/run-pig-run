extends Node2D

onready var pig = $"../Pig"


func _on_AppleBasket_area_entered(apple:Apple):
	if (!apple.isBeingEaten):
		apple.be_collected()
		if pig:
			pig.boost()

func _on_BaconBasket_area_entered(obj:Area2D):
	var caughtPig = obj as PlayerPig
	if caughtPig:
		caughtPig.die()
