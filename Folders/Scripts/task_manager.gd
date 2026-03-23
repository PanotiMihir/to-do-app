extends Control

var popup = preload("res://Folders/Scenes/Reusable/input_box.tscn")

func get_task_details():
	var input_box = popup.instantiate()

	add_child(input_box)

	input_box.setup("Test", "234")

	var text = await input_box.submitted

	return text

func _on_create_pressed() -> void:
	print(await get_task_details())


func _on_remove_pressed() -> void:
	pass # Replace with function body.
