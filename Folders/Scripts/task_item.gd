extends Control

@onready var label = $PanelContainer/MarginContainer/HBoxContainer/Label
@onready var checkbox = $PanelContainer/MarginContainer/HBoxContainer/CheckBox

func _ready() -> void:
    label.text = "hello"
    checkbox.button_pressed = true 