shader_type spatial;

uniform vec3 pos;
varying flat vec3 normalized;

void vertex() {
	vec3 funnyPos = pos;
	funnyPos.y = 0.;
	normalized = (inverse(MODEL_MATRIX)*vec4(funnyPos, 1.0)).xyz/20.;
	vec2 st = UV*2.-1.;
	VERTEX.y += sin(32.*3.141592*distance(st, normalized.xz))/15./4.;
}

void fragment() {
	vec2 st = UV*2.-1.;
	float height = 0.;
	height += sin(32.*3.141592*distance(st, normalized.xz));
	ALBEDO = vec3(height);
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}
