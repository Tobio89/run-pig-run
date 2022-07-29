extends Label

onready var speechTimeout = $SpeechTimeout

func setText(newText:String):
	text = newText
	speechTimeout.start(2)


func _on_SpeechTimeout_timeout():
	text = ""
