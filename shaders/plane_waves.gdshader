shader_type spatial;

uniform vec3 pos;
varying vec3 normalized;

void vertex() {
	vec3 funnyPos = pos;
	funnyPos.y = 0.;
	normalized = (inverse(MODEL_MATRIX)*vec4(funnyPos, 0.0)).xyz;
	vec2 recenteredUV = UV*2.-1.;
	float a = distance(normalized.xz, recenteredUV)-0.5;
	//a*=20.;
	VERTEX += smoothstep(-0.3, 0.3, fract((a-TIME)))/2.;
}

void fragment() {
	vec2 recenteredUV = UV*2.-1.;
	float a = distance(normalized.xz, recenteredUV)-0.5;
	//a*=20.;
	ALBEDO = vec3(smoothstep(0, 0.2, fract(abs(a-TIME))));
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}


