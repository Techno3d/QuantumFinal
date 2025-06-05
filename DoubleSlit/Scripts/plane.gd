extends MeshInstance3D

@onready var particle: MeshInstance3D = $"../Particle"
var stored_pos: Vector3;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    stored_pos = particle.global_position
    get_surface_override_material(0).set_shader_parameter("pos", stored_pos)
