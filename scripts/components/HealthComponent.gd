extends Node
class_name HealthComponent

@export var body: CharacterBody2D
@export var max_hp: int = 1

var hp: int

func _ready() -> void:
	hp = max_hp

func take_damage(dmg:int) -> void:
	if !is_alive():
		return
	hp = max(0, hp-dmg)
	if hp == 0:
		die()

func is_alive() -> bool:
	return hp > 0

func die() -> void:
	body.queue_free()
