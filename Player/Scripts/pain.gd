class_name PlayerPainState
extends PlayerState

@onready var hurt_box: Area2D = $HurtBox

var has_pained: bool

func enter() -> void:
	has_pained = false
	player.animation.play(pain_anim)
	player.animation.animation_finished.connect(func(_anim): has_pained = true)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0
	
func process_input(event: InputEvent) -> State:
	super(event)
	if has_pained and event.is_action_pressed(movement_key):
		determine_sprite_flipped(event.as_text())
		return walk_state
	elif has_pained and event.is_action_pressed(jump_key): return jump_state
	return null
	
func process_physics(delta: float) -> State:
	push_back()
	return super(delta)
	
func process_frame(delta: float) -> State:
	if has_pained: return idle_state
	return super(delta)
	
func push_back() -> void:
	var push_dir: Vector2 = hurt_box.hitting_area.global_position - player.global_position
	player.velocity.x += push_dir.x * 0.25
	
func add_game_juice() -> void:
	push_back()
	camera.set_zoom_str(1.0125)
	camera.set_shake_str(Vector2(4, 4))
