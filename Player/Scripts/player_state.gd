class_name PlayerState
extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

var idle_anim: String = "Idle"
var walk_anim: String = "Walk"



@export_group("States")
@export var idle_state: PlayerState
@export var walk_state: PlayerState


var sprite_flipped: bool = false


var movement_key: String = "Movement"
var left_key: String = "Left"
var right_key: String = "Right"

var left_actions: Array = InputMap.action_get_events(left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
var right_actions: Array = InputMap.action_get_events(right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))


func determine_sprite_flipped(event_text: String) -> void:
	if left_actions.find(event_text) != -1: sprite_flipped = true
	elif right_actions.find(event_text) != -1: sprite_flipped = false
	player.sprite.flip_h = sprite_flipped
	pass

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
	
	
func exit(new_state: State = null) -> void:
	super()
	new_state.sprite_flipped = sprite_flipped
