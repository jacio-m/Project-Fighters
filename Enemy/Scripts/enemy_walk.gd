class_name EnemyWalkState
extends EnemyState

const SPEED: float = 100

func enter() -> void:
	super()
	enemy.animation.play(walk_anim, -1, 2)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	enemy.velocity.x = 0.0	
	
func process_input(event: InputEvent) -> State:
		super(event)
		if event.is_action_pressed(enemy_movement_key): determine_sprite_flipped(event.as_text())
		elif event.is_action_pressed(enemy_jump_key): return jump_state
		elif event.is_action_pressed(enemy_punch_key): return punch_state
		elif event.is_action_pressed(enemy_kick_key): return kick_state
		return null
	
func process_physics(delta: float) -> State:
	do_move(get_move_dir())
	if get_move_dir() == 0.0: return idle_state
	super(delta)
	return null

func get_move_dir() -> float: return Input.get_axis(enemy_left_key, enemy_right_key)

func do_move(move_dir: float) -> void: enemy.velocity.x = move_dir * SPEED
