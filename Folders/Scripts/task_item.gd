extends Control

@onready var label = $MarginContainer/HBoxContainer/Label # Preloads the label node so I dont have to type the whole path a billion times
@onready var checkbox = $MarginContainer/HBoxContainer/CheckBox # Same as above but for the Checkbox node

func get_ready(lable : String, completed : bool): # Prepares the item displays to be displayed
	label.text = lable # Sets the label of the item to the lable (Named weiredly bc I named the label node with the same name) var passed when calling the func.
	checkbox.button_pressed = completed # Same as above but for the true or false value of the checkbox.
