extends Node
class_name Attack

var config: AttackConfig

func init(config:AttackConfig) -> void:
	self.config = config
	

func try_attack() -> bool:
	if $Timer.time_left > 0:
		return false
	return attack()
	
func attack() -> bool:
	$Timer.start(config.cooldown)
	var attack = config.attack_obj.instantiate()
	add_child(attack)
	# configure attack with params
	return true
