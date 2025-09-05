class_name PlayerFallState
extends PlayerState

const AIR_SPEED: float = 60
const JUMP_FORCE: float = 20

func enter() -> void:
	super()
	player.velocity.y = JUMP_FORCE
	player.animation.play(fall_anim, -1, 2)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0.0
	
func process_input(event: InputEvent) -> State:
		super(event)
		if event.is_action_pressed(movement_key): determine_sprite_flipped(event.as_text())
		return null
	
func process_physics(delta: float) -> State:
	do_move(get_move_dir())
	if(player.is_on_floor()): 
		if get_move_dir() != 0.0: return walk_state
		else: return idle_state
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null

func get_move_dir() -> float: return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void: player.velocity.x = move_dir * AIR_SPEED
