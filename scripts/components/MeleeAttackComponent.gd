extends AttackComponent
class_name MeleeAttackComponent

@export var hitbox: CollisionShape2D

# temp used until we get anims in
var disable_next_frame: int = 0

func _process(delta: float) -> void:
	if disable_next_frame == 1:
		hitbox.disabled = true
		disable_next_frame = 0
	elif disable_next_frame > 1:
		disable_next_frame -= 1

func attack() -> void:
	hitbox.disabled = false
	disable_next_frame = 10
	super.attack()
	
func attack_body(body: Node2D) -> void:
	var health = body.find_child("HealthComponent") as HealthComponent
	if health:
		health.take_damage(self.damage)

func _on_area_2d_body_entered(body: Node2D) -> void:
	attack_body(body)
