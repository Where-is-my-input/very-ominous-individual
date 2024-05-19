extends CanvasLayer
@onready var hours = $Control/hours
@onready var minutes = $Control/minutes
@onready var seconds = $Control/seconds
@onready var miliseconds = $Control/miliseconds
@onready var notices = $notices
@onready var tmr_notice = $notices/tmrNotice
@onready var lbl_notice = $notices/ColorRect/lblNotice

var noticeBox = 0
var noticeExplanation = ""

func _ready():
	notices.visible = false
	Stats.connect("jumpCollected", jumpCollected)
	Stats.connect("dashCollected", dashCollected)
	Stats.connect("grabTutorial", grabTutorial)
	hours.visible = Stats.showTimer
	minutes.visible = Stats.showTimer
	seconds.visible = Stats.showTimer
	miliseconds.visible = Stats.showTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	updateTimer()

func updateTimer():
	hours.text = "%02d:" % Stats.hours
	minutes.text = "%02d:" % Stats.minutes
	seconds.text = "%02d." % Stats.seconds
	miliseconds.text = "%03d" % Stats.msec

func jumpCollected():
	lbl_notice.text = "You got double jump"
	noticeExplanation = "Press Z or Space or Enter to jump or double jump"
	notices.visible = true
	noticeBox = 0
	tmr_notice.start(5)
#you got double jump

func dashCollected():
	lbl_notice.text = "You got dash"
	noticeExplanation = "Press X or KeyPad 4 or Shift to dash"
	notices.visible = true
	noticeBox = 0
	tmr_notice.start(5)
	
func grabTutorial():
	lbl_notice.text = "Press C or KeyPad 1 or Ctrl to grab boxes or interact with levers"
	notices.visible = true
	noticeBox = 1
	tmr_notice.start(5)

func _on_tmr_notice_timeout():
	if noticeBox == 0:
		lbl_notice.text = noticeExplanation
		noticeBox += 1
		tmr_notice.start(5)
	else:
		notices.visible = false
		noticeBox = 0
