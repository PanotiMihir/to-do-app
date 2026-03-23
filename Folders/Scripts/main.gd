extends Control

var task_manager = preload("res://Folders/Scenes/task_manager.tscn")

func _ready() -> void:
	Global.popup_open = false
	var temp = task_manager.instantiate()
	add_child(temp)