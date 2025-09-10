extends CanvasLayer

@export_file("*.json") var d_file


func load_dialog():
	var file = FileAccess.open("res://Dialogue/json/tutorial.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
