extends AnimatedSprite2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	play("idle")
