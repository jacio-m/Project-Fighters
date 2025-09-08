class_name Enemy
extends CharacterBody2D

@onready var enemy_state_machine: EnemyStateMachine = $"Enemy State Machine"
@onready var animation: AnimationPlayer = $Animation
@onready var sprite: AnimatedSprite2D = $Sprite

func _ready(): enemy_state_machine.init()

func _process(delta): enemy_state_machine.process_frame(delta)

func _physics_process(delta): enemy_state_machine.process_physics(delta)

func _input(event): enemy_state_machine.process_input(event)
