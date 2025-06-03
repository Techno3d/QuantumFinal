extends MeshInstance3D

var t: float = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t+=delta;
	position = Vector3(10*sin(t), 0.5, 10*cos(t))