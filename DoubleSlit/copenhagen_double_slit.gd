extends Node3D

var point1: Vector2 = Vector2(1.348, 0)
var point2: Vector2 = Vector2(-1.348, 0)

@onready var timer: Timer = $ParticleMeasureTimer
var particle: PackedScene = preload("res://DoubleSlit/particle.tscn")

func _ready():
	timer.timeout.connect(spawn_particle)

func spawn_particle():
	var p_amp: float = find_p_amp(0);
	p_amp *= p_amp
	for i in range(-1000, 1000, 50):
		var j = i/100.
		# This is the trapezoidal reimann aproximation for the probability
		var probs = (find_p_amp(j)*find_p_amp(j) + find_p_amp(j+0.05)*find_p_amp(j+0.05))
		if randf() > probs and randf() > 0.8:
			var child: MeshInstance3D = particle.instantiate();
			add_child(child)
			child.position = Vector3(j+0.025, 0.5+randf_range(-0.4, 3), 10.2)
			break;



func find_p_amp(x: float) -> float:
	return (sin(32*PI*point1.distance_to(Vector2(x, 10.6))) + sin(32*PI*point2.distance_to(Vector2(x, 10.6))))/2.
