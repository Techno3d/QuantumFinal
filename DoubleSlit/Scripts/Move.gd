class_name Move
extends MeshInstance3D

const speed = 30
var vel: Vector3 = Vector3(speed, 0, 0)
var slit_pos: Vector3 = Vector3(12, 0, 1.25)
var slit_pos2: Vector3 = Vector3(12, 0, -1.25)
var why: bool = false
var why2: bool = false

func reset():
	position = Vector3(-35, 0, 0)
	vel = Vector3(speed, 0, 0)
	why = false
	why2 = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !why and position.x > 9 and position.x < 9.5:
		var focus = slit_pos
		if randf() > 0.5:
			focus = slit_pos2
		var vel_dir: Vector3 = (focus-position).normalized()
		vel_dir *= speed
		vel = vel_dir
		if(vel.x < 0):
			print("no2")
		why = true
	if !why2 and position.x > 12.5:
		var possible_positions: Array[Vector3] = []
		for i in range(-2000, 2000, 50):
			var j = i/100.
			# This is the trapezoidal reimann aproximation for the probability
			var probs = (find_p_amp(j)*find_p_amp(j) + find_p_amp(j+0.025)*find_p_amp(j+0.025))
			if randf() > probs and randf() > 0.5:
				possible_positions.push_back(Vector3(20.351, 0.5+randf_range(-0.4, 3), j+0.025))
		var focus = possible_positions.pick_random()
		var dir = (focus - position).normalized()
		vel = dir * speed
		if(vel.x < 0):
			print("no1")
		why2 = true
	if(vel.x < 0):
		print("no")
	position += vel*delta




func find_p_amp(x: float) -> float:
	const B = 16
	return (sin(B*PI*slit_pos.distance_to(Vector3(20.351, 0, x))) + sin(B*PI*slit_pos2.distance_to(Vector3(20.351, 0, x))))/2.
