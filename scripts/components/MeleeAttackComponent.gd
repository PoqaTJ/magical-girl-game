extends AttackComponent
class_name MeleeAttackComponent

@export var attack_node: Node2D
@export var melee_attack_duration: float = 0.2

func _ready() -> void:
	remove_child(attack_node)
	$MeleeAttackTimer.timeout.connect(melee_end)

func attack() -> void:
	add_child(attack_node)
	$MeleeAttackTimer.start(melee_attack_duration)
	super.attack()
	
func melee_end() -> void:
	remove_child(attack_node)
