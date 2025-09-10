class_name ControlTutorial
extends Control

@onready var quit_button = $"Quit Button"

func _ready():
	quit_button.pressed.connect(quit_button_pressed)

func quit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
