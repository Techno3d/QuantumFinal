shader_type spatial;

void vertex() {
	vec2 center = vec2(0., -20.);
	vec2 st = UV*2.-1.;
	//st.x /= 20.;
	//st.y /= 30.;
	VERTEX.y += sin(32.*3.141592*distance(center, st)-TIME*5.)/4.;
}

void fragment() {
	vec2 center = vec2(0., -20.);
	vec2 st = UV*2.-1.;
	//st.x /= 20.;
	//st.y /= 30.;
	ALBEDO = vec3(sin(32.*3.141592*distance(center, st)-TIME*5.));
	//ALBEDO = vec3(distance(center, st), 0., 0.);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
