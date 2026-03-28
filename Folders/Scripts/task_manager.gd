extends Control

# Preload the input box scene to use throughout the entire session
var input_box_preload = preload("res://Folders/Scenes/Reusable/input_box.tscn")

var tasks : Array = [] # The default task array

func _ready() -> void:
	tasks = SaveManager.load_data(Global.tasks_filename ,tasks)
	# Loads the data in the save location in the tasks list and keeps the list empty if there is no save file.
	print_tasks() # Prints the tasks so i can see the list of the task at the beggining of the project

func print_tasks():
	print("\n==== Tasks ====")
	for task in tasks: # Prints task properly so it's easier for me to analyse them
		var data = "Task Name: '" + task["task_name"] + "' Completed: " + str(task["completed"]) # Crestes the line to be printed
		print(data) # Prints the line

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

	if task_name == null: # Ensures that if the user pressed escape, nothing happens
		return

	var task = {"task_name" : task_name, "completed" : false} # Creates the mini-dict to be added to the main task list.

	tasks.append(task) # Adds the mini-dict to the main task list.

	SaveManager.save_data(Global.tasks_filename, tasks) # Saves the list.
	
	print_tasks() # Prints the task so that I can see the updated list

func _on_remove_pressed() -> void:
	pass # Replace with function body.
