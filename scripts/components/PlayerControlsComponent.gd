extends Node
class_name PlayerControlsComponent

@export var body: CharacterBody2D
@export var move: MoveComponent
@export var baseAttack: AttackComponent

func _physics_process(delta: float) -> void:
	move.look_direction = body.get_global_mouse_position() - body.position
	move.move_direction = Input.get_vector("left", "right", "up", "down")
	baseAttack.try_attack = Input.is_action_pressed("base_attack")
