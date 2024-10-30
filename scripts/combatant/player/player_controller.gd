extends Combatant

func _process(delta:float) -> void:
	move_direction = Input.get_vector("left", "right", "up", "down")
	look_direction = get_global_mouse_position() - position
	self.use_base_attack = Input.is_action_pressed("base_attack")
		
