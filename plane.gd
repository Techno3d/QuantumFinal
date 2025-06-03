extends MeshInstance3D

@onready var particle: MeshInstance3D = $"../Particle"
var stored_pos: Vector3 = Vector3(0, 0, 0);

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	stored_pos.y += delta
	if stored_pos.y > 2:
		stored_pos = particle.global_position
		stored_pos.y = 0
	get_surface_override_material(0).set_shader_parameter("pos", stored_pos);
