class_name State
extends Node2D
   
func exit(new_state: State = null) -> void:
	pass

func enter() -> void:
	pass

func process_frame(delta: float) -> State:
	return null

func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return null 
