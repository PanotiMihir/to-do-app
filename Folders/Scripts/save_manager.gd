extends Node

const save_location : String = "user://GameData/" # This variable holds the folder where all the files will be saved.

func save_data(file_name, data): # Takes file_name and data as inputs to save the data to the save location. Different files will be created for different filenames
	DirAccess.make_dir_recursive_absolute(save_location) # Makes sure the save_location is there, and if it isnt, it creates one

	var path = save_location + file_name + ".json" # Assembles the entire path to the file, so I dont have to pass the full path as an arg

	var file = FileAccess.open(path, FileAccess.WRITE) # Opens the file in read mode

	if file == null: # Ensures that the code dosent stop if theres an error in opening the file
		print("File null: ", file_name) # Prints the error for easier debugging
		return # Stops the script

	var string = JSON.stringify(data) # Converts the json data into string format to store into any type of file.

	if string == null: # Prevents crashes if the string couldn't load properly
		print("Error in parsing the json data as string. Error from save manager, save func.") # Prints the error message for easier debugging
		return # Stops the script

	file.store_string(string) # Saves the string to the file

	file.close() # Closes the file

func load_data(file_name, default_data): # Takes file_name and default_data as inputs to load saved data. Returns default_data if anything fails
	
	var path = save_location + file_name + ".json" # Assembles the full path to the file, same as in save_data

	if not FileAccess.file_exists(path): # Checks if the file even exists before trying to open it
		print("File does not exist: ", file_name) # Debug message
		return default_data # Returns default if no file is found

	var file = FileAccess.open(path, FileAccess.READ) # Opens the file in read mode

	if file == null: # Ensures the code doesn't break if file couldn't be opened
		print("File null while loading: ", file_name) # Debug message
		return default_data # Return default data on failure

	var contents = file.get_as_text() # Reads the file content as text

	if contents == "": # Optional safety check for empty file
		print("File empty: ", file_name)
		file.close()
		return default_data

	var data = JSON.parse_string(contents) # Converts the text back into usable data

	if data == null: # Prevents crashes if JSON parsing fails
		print("Error parsing JSON while loading: ", file_name)
		file.close()
		return default_data

	file.close() # Closes the file after reading
	
	return data
