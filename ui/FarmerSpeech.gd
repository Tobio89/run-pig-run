extends Label

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

func _ready():
	text = comeHereMsgs[0]
