class_name EnemyState
extends State

@onready var enemy: Enemy = get_tree().get_first_node_in_group("Enemy")
@onready var camera: Camera = get_tree().get_first_node_in_group("Camera")

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

var idle_anim: String = "Enemy Idle"
var walk_anim: String = "Enemy Walk"
var jump_anim: String = "Enemy Jump"
var fall_anim: String = "Enemy Fall"
var punch_anim: String = "Enemy Punch"
var kick_anim: String = "Enemy Kick"
var pain_anim: String = "Enemy Pain"


@export_group("Enemy States")
@export var idle_state: EnemyState
@export var walk_state: EnemyState
@export var jump_state: EnemyState
@export var fall_state: EnemyState
@export var punch_state: EnemyState
@export var kick_state: EnemyState
@export var pain_state: EnemyState


var sprite_flipped: bool = false


var enemy_movement_key: String = "Enemy Movement"
var enemy_left_key: String = "Enemy Left"
var enemy_right_key: String = "Enemy Right"
var enemy_jump_key: String = "Enemy Jump"
var enemy_punch_key: String = "Enemy Punch"
var enemy_kick_key: String = "Enemy Kick"

var left_actions: Array = InputMap.action_get_events(enemy_left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
var right_actions: Array = InputMap.action_get_events(enemy_right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))


func determine_sprite_flipped(event_text: String) -> void:
	if left_actions.find(event_text) != -1: sprite_flipped = true
	elif right_actions.find(event_text) != -1: sprite_flipped = false
	enemy.sprite.flip_h = sprite_flipped
	pass

func process_physics(delta: float) -> State:
	if(enemy.velocity.y > 0): return fall_state
	enemy.velocity.y += gravity * delta
	enemy.move_and_slide()
	return null
	
	
func exit(new_state: State = null) -> void:
	super()
	new_state.sprite_flipped = sprite_flipped
