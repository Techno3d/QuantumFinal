extends CanvasLayer

@onready var back: Button = $MarginContainer/VBoxContainer/HBoxContainer/Back

func _ready():
	back.pressed.connect(func():
		get_tree().change_scene_to_file("res://Museum.tscn")
	)
