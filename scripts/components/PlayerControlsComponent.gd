extends Node
class_name PlayerControlsComponent

@export var body: CharacterBody2D
@export var move: MoveComponent
@export var base_attack: AttackComponent
@export var special_attack: AttackComponent

func _physics_process(delta: float) -> void:
	move.look_direction = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")
	move.move_direction = Input.get_vector("left", "right", "up", "down")
	base_attack.try_attack = Input.is_action_pressed("base_attack")
	special_attack.try_attack = Input.is_action_pressed("special_attack")
	special_attack.look_direction = move.look_direction
