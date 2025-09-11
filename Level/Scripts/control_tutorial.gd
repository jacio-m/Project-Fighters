class_name ControlTutorial
extends Control

var current_line = 1

@onready var line1 = $"TutorialLine1"
@onready var line2 = $"TutorialLine2"
@onready var line3 = $"TutorialLine3"
@onready var line4 = $"TutorialLine4"
@onready var line5 = $"TutorialLine5"
@onready var line6 = $"TutorialLine6"
@onready var line7 = $"TutorialLine7"

func _input(event):
	if event.is_action_pressed("ui_accept"):
		match current_line:
			1:
				line1.visible = false
				line2.visible = true
				current_line += 1
			2:
				line2.visible = false
				line3.visible = true
				current_line += 1
			3:
				line3.visible = false
				line4.visible = true
				current_line += 1
			4:
				line4.visible = false
				line5.visible = true
				current_line += 1
			5:
				line5.visible = false
				line6.visible = true
				current_line += 1
			6:
				line6.visible = false
				line7.visible = true
				current_line += 1
			7:
				line7.visible = false
				get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
