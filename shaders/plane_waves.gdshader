shader_type spatial;

uniform vec3[15] pos;
varying flat vec3[15] normalized;

void vertex() {
	for(int i = 0; i < 15; i++) {
		vec3 funnyPos = pos[i];
		funnyPos.y = 0.;
		normalized[i] = (inverse(MODEL_MATRIX)*vec4(funnyPos, 1.0)).xyz/20.;
		//vec2 st = UV*2.-1.;
		//vec3 col = vec3(0.);
		//for(int i = 0; i < 15; i++) {
			//col += vec3(1.-smoothstep(0., 0.005, abs(distance(st, normalized[i].xz)-pos[i].y)) );
		//}
		//VERTEX.xz += col.xz;
	}
}

void fragment() {
	vec2 st = UV*2.-1.;
	float height = 0.;
	for(int i = 0; i < 15; i++) {
		//vec2 dir = vec2(1., 0.);
		//if(dot(dir, normalized[i].xz) > 0.) {
			//vec2 center = normalize(normalized[i].xz); //Normalized
			//center *= 1./center.x; //Scale x to 1
			//height += 1.-smoothstep(0., 0.005, abs(distance(st, center))-pos[i].y);
		//}
		//height += 1.-smoothstep(0., 0.005, abs(distance(st, normalized[i].xz)-pos[i].y));
		height += sin(32.*3.141592*distance(st, normalized[i].xz))/2.0;
	}
	ALBEDO = vec3(height);
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}
