class_name EnemyState
extends State

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

var enemyidle_anim: String = "Idle"

@export_group("States")
@export var enemyidle_state: PlayerState

var sprite_flipped: bool = false
	
	
func exit(new_state: State = null) -> void:
	super()
	new_state.sprite_flipped = sprite_flipped
