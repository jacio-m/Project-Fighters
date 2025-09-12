class_name EnemyJumpState
extends EnemyState

const AIR_SPEED: float = 100
const JUMP_FORCE: float = -400

func enter() -> void:
	super()
	enemy.velocity.y = JUMP_FORCE
	enemy.animation.play(jump_anim, -1, 2)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	enemy.velocity.x = 0.0
	
func process_input(event: InputEvent) -> State:
		super(event)
		if event.is_action_pressed(enemy_movement_key): determine_sprite_flipped(event.as_text())
		if event.is_action_released(enemy_jump_key): enemy.velocity.y = 0
		return null
	
func process_physics(delta: float) -> State:
	do_move(get_move_dir())
	return super(delta)

func get_move_dir() -> float: return Input.get_axis(enemy_left_key, enemy_right_key)

func do_move(move_dir: float) -> void: enemy.velocity.x = move_dir * AIR_SPEED
