extends Node

const SAVE_LOCATION = "user://GameData/"
	
func save_data(file_name, data : Dictionary):
	DirAccess.make_dir_recursive_absolute(SAVE_LOCATION)
	
	var path = SAVE_LOCATION + file_name + ".json"
	
	var file = FileAccess.open(path, FileAccess.WRITE)
	
	if file == null:
		print("Error opening the file ", file_name, ". Error from save_manager.")
		return
	
	var string = JSON.stringify(data)
	
	file.store_string(string)
	
	file.close()

func load_data(file_name, default_data : Dictionary) -> Dictionary:
	var path = SAVE_LOCATION + file_name + ".json"
	
	if not FileAccess.file_exists(path):
		return default_data
	
	var file = FileAccess.open(path, FileAccess.READ)
	
	if file == null:
		print("Could not read the file ", file_name, ". Error from save_manager.")
		return default_data
	
	var contents = file.get_as_text()
	
	file.close()
	
	var data = JSON.parse_string(contents)
	
	if data == null:
		return default_data
	
	return data
