extends Node3D

@export var global_center = Vector3(0, 0, 0)
@onready var area: Area3D = $Camera3D/MeshInstance3D/Area3D
@onready var cam: Camera3D = $Camera3D
@onready var ball: MeshInstance3D = $Camera3D/MeshInstance3D
var mouse_inside: bool = false
var mouse_pressed: bool = false

func _ready():
	area.mouse_entered.connect(func():
		mouse_inside = true
	)
	area.mouse_exited.connect(func():
		mouse_inside = false
	)
	var old_pos = position
	global_position = global_center
	cam.global_position = old_pos

func _process(_delta):
	if Input.is_action_just_pressed("mousePress") and mouse_inside:
		mouse_pressed = true
	if Input.is_action_just_released("mousePress"):
		mouse_pressed = false

func _input(event):
	if event is InputEventMouseMotion and mouse_pressed:
		var mouse_motion = event as InputEventMouseMotion
		var rel = mouse_motion.relative
		rotation_degrees.y += rel.x/10.
		rotation_degrees.x += rel.y/10.
		ball.rotation_degrees.y += rel.x/10.
		ball.rotation_degrees.x += rel.y/10.
