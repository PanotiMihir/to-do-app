extends Control

# Preload the input box scene to use throughout the entire session
var input_box_preload = preload("res://Folders/Scenes/Reusable/input_box.tscn")

var tasks : Array = [] # The default task array
const save_file = "tasks" # The name of the save file

func _ready() -> void:
	tasks = SaveManager.load_data(save_file, tasks)
	# Loads the data in the save location in the tasks list and keeps the list empty if there is no save file.
	print(tasks) # prints the task list so that I can view the tasks and see if the savng system is working before I setup the display system.
	for task in tasks:
		var data = task["task_name"] + " " + str(task["completed"])
		print(data)

func get_task_details():
	var input_box = input_box_preload.instantiate()
	# Loads the scene in the var input_box so that we can use it later.
	# If the scene is not intanciated than it wont work.

	add_child(input_box)
	# Adds the input_box instanciated scene as a child so we can manage its settings and make it appear on screen.

	input_box.setup("Enter the task:", "For example : Hang clothes")
	# Setups the input box with the title and a placeholder text which will disappear as soon as as I type something in the line_edit.

	var text = await input_box.submitted
	# waits for the input_box scene to fire the signal submitted, and then puts the arg that came with it in the var text

	return text
	# Returns the var text

func _on_create_pressed() -> void:
	var task_name = await get_task_details() # Gets the name of the task from the user.

	var task = {"task_name" : task_name, "completed" : false} # Creates the mini-dict to be added to the main task list.

	tasks.append(task) # Adds the mini-dict to the main task list.

	SaveManager.save_data(save_file, tasks) # Saves the list.

func _on_remove_pressed() -> void:
	pass # Replace with function body.
