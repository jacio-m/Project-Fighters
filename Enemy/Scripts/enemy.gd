class_name Enemy
extends CharacterBody2D

@onready var animation: AnimationPlayer = $"Enemy Animation"
@onready var sprite: AnimatedSprite2D = $"Enemy Sprite"
@onready var enemy_idle_anim: String = "Enemy Idle"

func _ready(): 
	animation.play(enemy_idle_anim)
