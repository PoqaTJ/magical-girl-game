extends Node2D

@export var move: MoveComponent
var target: Node2D = null


func on_area_entered(area: Area2D) -> void:
	if area.name.begins_with("Player"):
		target = area		
	
func on_area_left(area: Area2D) -> void:
	if area == target:
		area = null

func _physics_process(delta: float) -> void:
	if target != null:
		var dir: Vector2 = target.global_position - self.global_position 
		move.move_direction = dir.normalized()
	else:
		move.move_direction = Vector2.ZERO


func _on_area_2d_body_entered(body: Node2D) -> void:
	target = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	target = null
