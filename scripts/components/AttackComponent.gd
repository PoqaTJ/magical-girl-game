extends Node2D
class_name AttackComponent

@export var damage: int = 1
@export var cooldown: float = 0.5
var try_attack: bool = false

func _ready() -> void:
	$Timer.time_left = 0

func _physics_process(delta: float) -> void:
	if try_attack and can_attack():
		attack()
	
func can_attack() -> bool:
	print($Timer.time_left)
	return $Timer.time_left == 0

func attack() -> void:
	$Timer.start(cooldown)
