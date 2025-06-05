extends MeshInstance3D

var stored_pos: Vector3;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var particle: Move = get_tree().get_first_node_in_group("Particles")
	if particle != null:
		stored_pos = particle.global_position
		get_surface_override_material(0).set_shader_parameter("pos", stored_pos)
	else:
		get_surface_override_material(0).set_shader_parameter("pos", Vector3(-40, 0, 0))
