extends CharacterBody2D
class_name ProjectileController

@export var speed: float = 250
@export var damage: int = 1
var direction: Vector2

func _physics_process(delta: float) -> void:
	direction = direction
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		var healthComponent = collider.find_child("HealthComponent")
		if healthComponent:
			healthComponent.take_damage(damage)
		queue_free()
