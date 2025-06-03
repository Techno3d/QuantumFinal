extends MeshInstance3D

@onready var particle: MeshInstance3D = $"../Particle"
var stored_poses: Array[Vector3];

func _ready():
	for i in range(0, 15):
		stored_poses.push_back(Vector3(0, 2.0/15.0*i, 0));


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for stored_pos in stored_poses:
		stored_pos.y += delta
		if stored_pos.y > 2:
			stored_pos = particle.global_position
			stored_pos.y = 0
	get_surface_override_material(0).set_shader_parameter("pos", stored_poses);
