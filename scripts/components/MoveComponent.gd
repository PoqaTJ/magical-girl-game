extends Node
class_name MoveComponent

@export var body: CharacterBody2D
@export var move_speed: float = 100
@export var backward_move_multiplier: float = 1

var look_direction: Vector2
var move_direction: Vector2

func _physics_process(delta: float) -> void:
	
	# if aim direction is set, rotate to aim in that direction.
	if look_direction.x != 0 or move_direction.x != 0:
		
		var look_dir = look_direction.x
		if look_dir == 0:
			look_dir = move_direction.x
		
		if look_dir < 0:
			body.transform.x.x = -1
		else:
			body.transform.x.x = 1
	var moving_backwards: bool = (look_direction.x > 0 and move_direction.x < 0) or (look_direction.x < 0 and move_direction.x > 0)

	# if movement direction is set, move in that direction.
	var speed: float = move_speed
	if moving_backwards:
		speed *= backward_move_multiplier

	body.velocity = speed * move_direction # * delta?
	body.move_and_slide()
