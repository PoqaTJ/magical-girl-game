extends Node
class_name PlayerControlsComponent

@export var body: CharacterBody2D
@export var move: MoveComponent
@export var base_attack: AttackComponent
@export var special_attack: AttackComponent

func _physics_process(delta: float) -> void:
	var look_direction: Vector2 = body.get_global_mouse_position() - body.position
	move.look_direction = look_direction
	move.move_direction = Input.get_vector("left", "right", "up", "down")
	base_attack.try_attack = Input.is_action_pressed("base_attack")
	special_attack.try_attack = Input.is_action_pressed("special_attack")
	special_attack.look_direction = look_direction
