shader_type spatial;

uniform vec3[15] pos;
varying flat vec3[15] normalized;

void vertex() {
	for(int i = 0; i < 15; i++) {
		vec3 funnyPos = pos[i];
		funnyPos.y = 0.;
		normalized[i] = (inverse(MODEL_MATRIX)*vec4(funnyPos, 1.0)).xyz/20.;
	}
}

void fragment() {
	vec2 st = UV*2.-1.;
	vec3 col = vec3(0.);
	for(int i = 0; i < 15; i++) {
		col += vec3(1.-smoothstep(0., 0.005, abs(distance(st, normalized[i].xz)-pos[i].y)) );
	}
	ALBEDO = col;
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}
