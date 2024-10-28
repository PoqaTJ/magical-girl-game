extends CharacterBody2D
class_name Combatant

@export var config: CombatantConfig

var move_direction: Vector2
var use_base_atack: bool
var look_direction: Vector2

func move_speed() -> float:
	return config.base_speed

func _physics_process(delta: float) -> void:

	# if aim direction is set, rotate to aim in that direction.
	if look_direction.x < 0:
		transform.x.x = -1
	else:
		transform.x.x = 1
	var moving_backwards: bool = (look_direction.x > 0 and move_direction.x < 0) or (look_direction.x < 0 and move_direction.x > 0)

	# if movement direction is set, move in that direction.
	var speed: float = move_speed()
	if moving_backwards:
		speed *= 0.8

	velocity = speed * move_direction
	move_and_slide()
		
