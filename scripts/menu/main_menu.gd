extends Control

func _on_test_area_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_area.tscn")
