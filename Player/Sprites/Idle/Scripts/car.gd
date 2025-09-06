extends Node2D

@export var max_hp: int = 100
var current_hp: int

@onalready var sprite: Sprite2D = $Sprite2D

func _ready():
	current_hp = max_hp
	
	
func take_damage(amount: int) -> void:
	current_hp -= amount
	if current_hp <= 0:
		queue_free()
	else:
		update_sprite()
		
func update_sprite():
	var damage _ratio = float (current_hp)/ max_hp
	if damage_ratio < 0.3:
		sprite.texture = preload(carro quebrado)
	
