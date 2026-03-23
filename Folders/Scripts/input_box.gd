extends Control

@onready var line_edit = $Panel/MarginContainer/VBoxContainer/LineEdit
@onready var card_label = $Panel/MarginContainer/VBoxContainer/Label

signal submitted(text : String)

var label : String = "None"
var placeholdertext : String = "None"

func get_text() -> String:
	return line_edit.text

func setup(new_label : String, new_place_holder : String):
	label = new_label
	placeholdertext = new_place_holder

	pop()

func pop():
	card_label.text = label
	line_edit.placeholder_text = placeholdertext

	await get_tree().process_frame

	line_edit.grab_focus()

func submit():
	var text = line_edit.text
	
	Global.popup_open = false
	
	submitted.emit(text)

	queue_free()

func _on_submit_pressed() -> void:
	submit()

func _on_line_edit_text_submitted(_new_text: String) -> void:
	submit()
