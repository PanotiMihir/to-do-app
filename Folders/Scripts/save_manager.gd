extends Node

const save_location : String = "user://GameData/" # This variable holds the folder where all the files will be saved.

func save_data(file_name, data):
	DirAccess.make_dir_recursive_absolute(save_location)

	var path = save_location + file_name + ".json"

	var file = FileAccess.open(path, FileAccess.WRITE)

	if file == null:
		print("File null: ", file_name)
		return

	var string = JSON.stringify(data)

	file.store_string(string)

	file.close()

func load_data(file_name, default_data):

	var path = save_location + file_name + ".json"

	if not FileAccess.file_exists(path):
		return default_data
	
	var file = FileAccess.open(path, FileAccess.READ)

	if file == null:
		return default_data

	var contents = file.get_as_text()

	var data = JSON.parse_string(contents)

	if data == null:
		return default_data

	file.close()

	return data