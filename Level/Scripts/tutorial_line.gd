extends RichTextLabel

@onready var label = $"."
@export var scale_factor: Vector2 = Vector2(0.25, 0.25)

func _ready():
	label.scale = scale_factor
	
