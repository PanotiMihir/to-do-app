extends Control

var popup = preload("res://Folders/Scenes/Reusable/card.tscn")

func _ready() -> void:
	Global.popup_open = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open"):
		if Global.popup_open == false:
			var instance = popup.instantiate()
			add_child(instance)
