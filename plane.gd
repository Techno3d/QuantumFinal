extends MeshInstance3D

@onready var particle: MeshInstance3D = $"../Particle"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(particle.position)
	get_surface_override_material(0).set_shader_parameter("pos", particle.global_position);
