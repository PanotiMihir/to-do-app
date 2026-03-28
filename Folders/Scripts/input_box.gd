extends Control

@onready var line_edit = $Panel/MarginContainer/VBoxContainer/LineEdit # Load the LineEdit as a var so I dont have to type the exact path a billion times.
@onready var card_label = $Panel/MarginContainer/VBoxContainer/Label # Same as above for the label node.

signal submitted(text) # Creates a signal named submitted with the arg text.

var label : String = "None" # Used to set the label of the input_box so that the user knows what to enter
var placeholdertext : String = "None" # Used in the LineEdit to add an example which will disappear as soon as the user types something

# Sets up the entire scene
func setup(new_label : String, new_place_holder : String):
	label = new_label # Sets the label var defined above to the label passed as an arg.
	placeholdertext = new_place_holder # Same as above for Place Holder Text

	pop() # Calls the function pop, which sets everything up.

# Sets up the lable and handles mouse redirection
func pop():
	card_label.text = label # Sets the label of the input_box scene to the label var
	line_edit.placeholder_text = placeholdertext # Same as above but for Place Holder Text

	await get_tree().process_frame # Waits for the entire scene to get loaded

	line_edit.grab_focus() # Focuses the cursor on the line edit so the user can start typing immediately

# Handles what happens when the user submits the input in any way.
func submit():
	var text = line_edit.text # Grabs the text from the line edit and puts it into a var
	
	Global.popup_open = false # Sets the popup open var in the global script as false, so we can open another popup.
	
	submitted.emit(text) # Emits the submitted signal defined above with the arg text which was grabbed from the lien edit

	queue_free() # Deletes the entire scene from the scene tree

# When the user presses the submit button
func _on_submit_pressed() -> void:
	submit() # Runs the submit func

# When the user presses enter in the line edit
func _on_line_edit_text_submitted(_new_text: String) -> void:
	submit() # Runs the submit func

# To add the functionality to quit without submitting a task
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		submitted.emit(null)
		queue_free()
