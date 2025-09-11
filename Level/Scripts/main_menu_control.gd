class_name MainMenuControl
extends Control

@onready var play_button = $"Play Button"
@onready var tutorial_button = $"Tutorial Button"

func _ready():
	play_button.pressed.connect(play_button_pressed)
	tutorial_button.pressed.connect(tutorial_button_pressed)

func play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")
	
func tutorial_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
