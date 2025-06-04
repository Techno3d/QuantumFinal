shader_type spatial;

void vertex() {
	vec2 center = vec2(0.14, -1.);
	vec2 center2 = vec2(-0.14, -1.);
	vec2 st = UV*2.-1.;
	//st.x /= 20.;
	st.y /= 2.;
	VERTEX.y = 
		sin(16.*3.141592*distance(center, st)-TIME*5.)/8.
		+
		sin(16.*3.141592*distance(center2, st)-TIME*5.)/8.;
}

void fragment() {
	vec2 center = vec2(0.14, -1.);
	vec2 center2 = vec2(-0.14, -1.);
	vec2 st = UV*2.-1.;
	//st.x /= 20.;
	st.y /= 2.;
	ALBEDO = 
		vec3(sin(16.*3.141592*distance(center, st)-TIME*5.))/2.
		+
		vec3(sin(16.*3.141592*distance(center2, st)-TIME*5.))/2.;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
