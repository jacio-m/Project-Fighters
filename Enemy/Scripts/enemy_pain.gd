class_name EnemyPainState
extends EnemyState

@onready var hurt_box: Area2D = $HurtBox

var has_pained: bool

func enter() -> void:
	has_pained = false
	enemy.animation.play(pain_anim)
	enemy.animation.animation_finished.connect(func(_anim): has_pained = true)
	was_damaged()
	
func exit(new_state: State = null) -> void:
	super(new_state)
	enemy.velocity.x = 0
	
func process_input(event: InputEvent) -> State:
	super(event)
	if has_pained and event.is_action_pressed(enemy_movement_key):
		determine_sprite_flipped(event.as_text())
		return walk_state
	elif has_pained and event.is_action_pressed(enemy_jump_key): return jump_state
	return null
	
func process_physics(delta: float) -> State:
	push_back()
	return super(delta)
	
func process_frame(delta: float) -> State:
	if has_pained: return idle_state
	return super(delta)
	
func push_back() -> void:
	var push_dir: Vector2 = hurt_box.hitting_area.global_position - enemy.global_position
	enemy.velocity.x += push_dir.x * 0.25
	
func add_game_juice() -> void:
	push_back()
	camera.set_zoom_str(1.0125)
	camera.set_shake_str(Vector2(4, 4))

func was_damaged():
	enemy.currentHealth -= 7
	if enemy.currentHealth < 0:
		#TODO DEATH
		enemy.currentHealth = enemy.maxHealth
	enemy.healthChanged.emit()
