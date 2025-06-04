extends Node3D

@onready var pivot = self
@onready var timer = $".".get_parent_node_3d().get_parent_node_3d().get_node("Debounce Timer")
var debounce = false;

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Open Box") and not debounce:
		var tween = get_tree().create_tween()
		timer.start()
		debounce = true;
		tween.tween_property(pivot, "rotation_degrees", Vector3(0, 0, 90), 1)
	if Input.is_action_just_pressed("Close Box") and not debounce:
		var tween = get_tree().create_tween()
		timer.start()
		debounce = true;
		tween.tween_property(pivot, "rotation_degrees", Vector3(0, 0, 0), 1)

func _on_debounce_timer_timeout() -> void:
	debounce = false;
