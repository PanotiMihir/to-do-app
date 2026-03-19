extends Control

func _ready() -> void:
	Global.popup_open = true

func queue():
	queue_free()
	Global.popup_open = false

func _on_completed_pressed() -> void:
	queue()

func _on_failed_pressed() -> void:
	queue()
