extends Control

@onready var tasklist = $MarginContainer/ScrollContainer/TaskList

var task_item = preload("res://Folders/Scenes/Reusable/task_item.tscn")

func _ready() -> void:
	refresh()

func refresh():
	for child in tasklist.get_children():
		child.queue_free()
	
	var tasks = SaveManager.load_data(Global.tasks_filename, [])

	for task in tasks:
		var task_entry = task_item.instantiate()
		tasklist.add_child(task_entry)
		task_entry.get_ready(task["task_name"], task["completed"])
