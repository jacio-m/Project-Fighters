class_name PlayerKickState
extends PlayerState

var has_attacked: bool

@onready var hitbox: Area2D = $HitBox

func enter() -> void:
	has_attacked = false
	if sprite_flipped: hitbox.scale.x = -1
	else: hitbox.scale.x = 1
	player.animation.play(kick_anim)
	player.animation.animation_finished.connect(func(_anim): has_attacked = true)
	await get_tree().create_timer(0.6).timeout
	player.get_node("HitSFX").play()
	
func process_input(event: InputEvent) -> State:
	super(event)
	if has_attacked and event.is_action_pressed(movement_key):
		determine_sprite_flipped(event.as_text())
		return walk_state
	elif has_attacked and event.is_action_pressed(jump_key): return jump_state
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if has_attacked: return idle_state 
	return null
