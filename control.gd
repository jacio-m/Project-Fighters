extends Control

var label = Label
var time = Time
@export var RedClr: Color
@export var OrigClr: Color

func _ready():
	label = $Label
	time = $Timer
	OrigClrRet()
	time.start()
	
func _process(delta):
	update_label_text()
	if time.time_left <= 5:
		label.modulate = RedClr
		
func OrigClrRet():
	label.modulate = OrigClr

func update_label_text():
	label.text = str(int(time.time_left))
