extends Node2D

var restart_key: String = "Restart Level"
var quit_key: String = "Quit Level"

func _process(delta) -> void:
	var control_timer = $"Control Timer"
	var player = $Player
	
	if control_timer.get_time().time_left == 0:
		player.set_process_input(false)
		$"TimeOut Label".visible = true
		if Input.is_action_just_pressed(restart_key):
			get_tree().reload_current_scene()
		if Input.is_action_just_pressed(quit_key):
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
