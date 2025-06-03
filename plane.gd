extends MeshInstance3D

@onready var particle: MeshInstance3D = $"../Particle"
var stored_poses: Array[Vector3];

func _ready():
	for i in range(0, 15):
		stored_poses.push_back(Vector3(0, 3/15.0*i, 0));


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(0, stored_poses.size()):
		stored_poses[i].y += delta
		if stored_poses[i].y > 3:
			stored_poses[i] = particle.global_position
			stored_poses[i].y = 0
	get_surface_override_material(0).set_shader_parameter("pos", stored_poses)
