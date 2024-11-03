extends Node2D
class_name AttackComponent

@export var damage: int = 1
@export var cooldown: float = 0.5
var try_attack: bool = false
var on_cooldown: bool = false

func _physics_process(delta: float) -> void:
	if try_attack and can_attack():
		attack()
	
func can_attack() -> bool:
	return !on_cooldown

func attack() -> void:
	$Timer.start(cooldown)
	on_cooldown = true

func on_timer_timeout() -> void:
	on_cooldown = false
