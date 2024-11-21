extends Node
class_name PlayerControlsComponent

@export var body: CharacterBody2D
@export var move: MoveComponent
@export var base_attack: AttackComponent
@export var special_attack: AttackComponent
@export var device_id: int = 0

func _physics_process(delta: float) -> void:
	move.look_direction = MultiplayerInput.get_vector(device_id, "aim_left", "aim_right", "aim_up", "aim_down")
	move.move_direction = MultiplayerInput.get_vector(device_id, "left", "right", "up", "down")
	base_attack.try_attack = MultiplayerInput.is_action_pressed(device_id, "base_attack")
	special_attack.try_attack = MultiplayerInput.is_action_pressed(device_id, "special_attack")
	special_attack.look_direction = move.look_direction
