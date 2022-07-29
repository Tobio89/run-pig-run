extends Node2D

const comeHereMsgs = [
	"Git back here, you varmint!!",
	"When ah git mah hands on you, ah swear..!",
	"You cain't run forever!",
	"C'mere, you!",
	"Here, piggy, piggy",
]

const eatMsgs = [
	"Leave mah apples be, gosh dangit!",
	"Ah swear, if you eat one more apple...",
	"Hah, ah'm catchin you up!",
	"You just cain't resist, can you?",
	"That's right, fatt'n yourself up...",
]

const pickUpMsgs = [
	"You missed one!",
	"Ah'll just pick this up",
	"Stupid pig, you missed one!",
	"I'd better pick that up",
	"*groans* got it"
]

const IDLE_TIME := 6

onready var label := $SpeechLabel
onready var timer := $IdleSpeechTimer

func _ready():
	label.setText(comeHereMsgs[0])
	timer.start(IDLE_TIME)

func _on_IdleSpeechTimer_timeout() -> void:
	if !Globals.GAME_OVER:
		label.setText(choose_msg(comeHereMsgs))
		reset_timer()

func set_eat_msg() -> void:
	label.setText(choose_msg(eatMsgs))
	reset_timer()

func set_pick_up_msg() -> void:
	label.setText(choose_msg(pickUpMsgs))
	reset_timer()

func choose_msg(msgArray) -> String:
	return msgArray[randi() % msgArray.size()]

func reset_timer():
		timer.start(IDLE_TIME)
