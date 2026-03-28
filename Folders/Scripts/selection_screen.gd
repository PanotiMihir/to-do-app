extends Control

func _on_task_manager_pressed() -> void:
	get_tree().change_scene_to_file("res://Folders/Scenes/task_manager.tscn")

func _on_task_display_pressed() -> void:
	get_tree().change_scene_to_file("res://Folders/Scenes/task_display.tscn")
