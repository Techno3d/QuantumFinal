shader_type spatial;

uniform vec3 pos;
varying vec3 normalized;

void vertex() {
	vec3 funnyPos = pos;
	funnyPos.y = 0.;
	normalized = (inverse(MODEL_MATRIX)*vec4(funnyPos, 1.0)).xyz/20.;
}

void fragment() {
	vec2 st = UV*2.-1.;
	//st -= normalized.xz;
	float a = 0.;

	//a += ploty(st, cos(st.x+TIME));
	float r = 0.25;
	float angle = atan(st.y, st.x);
	//ALBEDO = vec3(smoothstep(r, r+0.01, st.x*st.x + st.y*st.y));
	ALBEDO = vec3(smoothstep(0., 0.005, abs(distance(st, normalized.xz)-pos.y)) );
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}
