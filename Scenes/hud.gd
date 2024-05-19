extends CanvasLayer
@onready var hours = $Control/hours
@onready var minutes = $Control/minutes
@onready var seconds = $Control/seconds
@onready var miliseconds = $Control/miliseconds

func _ready():
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
