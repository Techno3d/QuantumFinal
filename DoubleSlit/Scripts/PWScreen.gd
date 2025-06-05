extends MeshInstance3D

@onready var area_detector: Area3D = $Area3D

var particle: PackedScene = preload("res://DoubleSlit/particle.tscn")

func _ready():
	area_detector.area_entered.connect(check_for_particle)

func check_for_particle(area: Area3D):
	if area.get_parent() is Move:
		var pos = (area.get_parent() as Move).position
		var child: Node3D = particle.instantiate()
		child.position = pos + Vector3.UP/0.5
		child.scale = Vector3.ONE*1.5
		get_tree().root.add_child(child)
		area.get_parent().queue_free()
