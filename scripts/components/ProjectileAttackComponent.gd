extends AttackComponent
class_name ProjectileAttackComponent

@export var projectileScene: PackedScene
@export var projectileOrigin: Node2D
var inactive_projectiles: Array
var look_direction: Vector2
var move_direction: Vector2

func attack() -> void:
	super.attack()
	fire_projectile()

func create_projectile() -> ProjectileController:
	var projectile: ProjectileController
	if inactive_projectiles.size() > 0:
		projectile = inactive_projectiles.pop_front()
	else:
		var inst = projectileScene.instantiate()
		projectile = inst as ProjectileController
	return projectile

func fire_projectile() -> void:
	var projectile:ProjectileController = create_projectile()
	get_tree().root.add_child(projectile)
	projectile.global_position = projectileOrigin.global_position
	if look_direction != Vector2.ZERO:
		projectile.direction = look_direction.normalized()
	else:
		if move_direction != Vector2.ZERO:	
			projectile.direction = Vector2.RIGHT # need to find body facing
		else:
			projectile.direction = move_direction.normalized()
	if projectile.direction == Vector2.ZERO:
		projectile.direction = Vector2.RIGHT

func return_projectile(projectile:ProjectileController) -> void:
	projectile.get_parent().remove_child(projectile)
	inactive_projectiles.append(projectile)
