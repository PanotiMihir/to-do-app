extends Control

var selection_menu = preload("res://Folders/Scenes/selection_screen.tscn")

func _ready() -> void:
	Global.popup_open = false
	var menu = selection_menu.instantiate()
	add_child(menu)
