shader_type spatial;

uniform vec3 pos;
varying vec3 normalized;

void vertex() {
	vec3 funnyPos = pos;
	funnyPos.y = 0.;
	normalized = (inverse(MODEL_MATRIX)*vec4(funnyPos, 1.0)).xyz/20.;
}

float ploty(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y);
}
float plotx(vec2 st, float pct){
  return  smoothstep( pct-0.02, pct, st.x) -
          smoothstep( pct, pct+0.02, st.x);
}

void fragment() {
	vec2 st = UV*2.-1.;
	st -= normalized.xz;
	float a = 0.;

	//a += ploty(st, cos(st.x+TIME));
	float r = 0.25;
	ALBEDO = vec3(smoothstep(r, r+0.01, st.x*st.x + st.y*st.y));
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}
