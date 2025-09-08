class_name EnemyIdleState
extends EnemyState

func enter() -> void:
	player.animation.play(enemyidle_anim)
	
func exit(new_state: State = null) -> void:
	super(new_state)
