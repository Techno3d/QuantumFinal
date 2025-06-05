shader_type spatial;

uniform vec3 pos;
varying flat vec3 normalized;

float funky(vec2 st) {
	float height = 0.;
	float line = 0.6;
	float slit_pos = 0.05;
	float slit_width = 0.02;
	float distMult = clamp(1.-distance(st, normalized.xz)-0.2, 0.001, 2.);
	height += sin(32.*3.141592*distance(st, normalized.xz)-TIME)/2.*distMult
		*(1.-step(line, st.x));
	float height2 = (sin(32.*3.141592*distance(st, vec2(line, slit_pos+slit_width/2.))-TIME))
		*clamp(1.-distance(st, vec2(line, +slit_pos+slit_width/2.))-0.2, 0., 1.)
		*clamp(1.-distance(normalized.xz, vec2(line, slit_pos+slit_width/2.))-0.2, 0., 1.)/4.;

	height2 +=  sin(32.*3.141592*distance(st, vec2(line, -slit_pos-slit_width/2.))-TIME)
		*clamp(1.-distance(st, vec2(line, -slit_pos-slit_width/2.))-0.2, 0., 1.)
		*clamp(1.-distance(normalized.xz, vec2(line, -slit_pos-slit_width/2.))-0.2, 0., 1.)/4.;

	float height3 = sin(32.*3.141592*distance(st, normalized.xz)-TIME)/2.*distMult
		*(step(line, st.x));

	//Reflections
	// LR/(R+r) + normalized.x is the center for the reflection
	float l = st.y-normalized.y;
	float R = line-normalized.x;
	float r = line-st.x;
	vec2 reflectionCenter = vec2(line, l*R/(r+R) + normalized.y);

	height += sin(32.*3.141592*distance(st, reflectionCenter)-TIME)/2.
		*(1.-distance(st, reflectionCenter))
		*distMult
		*(1.-step(line, st.x))
		*(
			smoothstep(slit_width+slit_pos, slit_pos+slit_width+0.005, reflectionCenter.y)
			+(1.0-smoothstep(-slit_pos-slit_width, -slit_pos-slit_width-0.005, reflectionCenter.y))
			+smoothstep(reflectionCenter.y, reflectionCenter.y-0.005, slit_pos)*smoothstep(-slit_pos, -slit_pos-0.005, reflectionCenter.y))
		;
	height3 += sin(32.*3.141592*distance(st, reflectionCenter)-TIME)/2.
		*distMult
		*(1.-distance(st, reflectionCenter))
		*step(line, st.x);
	return (height*step(normalized.x, line)
		+height2*step(line, st.x)*step(normalized.x, line) + height2*step(line, normalized.x)*step(st.x, line)
		+height3*step(line, normalized.x)
	);
}

void vertex() {
	vec3 funnyPos = pos;
	funnyPos.y = 0.;
	normalized = (inverse(MODEL_MATRIX)*vec4(funnyPos, 1.0)).xyz/20.;
	vec2 st = UV*2.-1.;

	//Reflections
	// LR/(R+r) + normalized.x is the center for the reflection

	VERTEX.y += funky(st);
}

void fragment() {
	vec2 st = UV*2.-1.;
	//float height = 0.;
	//float line = 0.6;
	//float slit_pos = 0.05;
	//float slit_width = 0.02;
	//float distMult = clamp(1.-distance(st, normalized.xz)-0.2, 0.001, 2.);
	//height += sin(32.*3.141592*distance(st, normalized.xz)-TIME)/2.*distMult
		//*(1.-step(line, st.x));
	//float height2 = (sin(32.*3.141592*distance(st, vec2(line, slit_pos+slit_width/2.))-TIME))
		//*clamp(1.-distance(st, vec2(line, +slit_pos+slit_width/2.))-0.2, 0., 1.)
		//*clamp(1.-distance(normalized.xz, vec2(line, slit_pos+slit_width/2.))-0.2, 0., 1.)/4.;
	//
	//height2 +=  sin(32.*3.141592*distance(st, vec2(line, -slit_pos-slit_width/2.))-TIME)
		//*clamp(1.-distance(st, vec2(line, -slit_pos-slit_width/2.))-0.2, 0., 1.)
		//*clamp(1.-distance(normalized.xz, vec2(line, -slit_pos-slit_width/2.))-0.2, 0., 1.)/4.;
		//
	//float height3 = sin(32.*3.141592*distance(st, normalized.xz)-TIME)/2.*distMult
		//*(step(line, st.x));
	//
	////Reflections
	//// LR/(R+r) + normalized.x is the center for the reflection
	//float l = st.y-normalized.y;
	//float R = line-normalized.x;
	//float r = line-st.x;
	//vec2 reflectionCenter = vec2(line, l*R/(r+R) + normalized.y);
	//
	//height += sin(32.*3.141592*distance(st, reflectionCenter)-TIME)/2.
		//*(1.-distance(st, reflectionCenter))
		//*distMult
		//*(1.-step(line, st.x))
		//*(
			//smoothstep(slit_width+slit_pos, slit_pos+slit_width+0.005, reflectionCenter.y)
			//+(1.0-smoothstep(-slit_pos-slit_width, -slit_pos-slit_width-0.005, reflectionCenter.y))
			//+smoothstep(reflectionCenter.y, reflectionCenter.y-0.005, slit_pos)*smoothstep(-slit_pos, -slit_pos-0.005, reflectionCenter.y))
		//;
	//height3 += sin(32.*3.141592*distance(st, reflectionCenter)-TIME)/2.
		//*distMult
		//*(1.-distance(st, reflectionCenter))
		//*step(line, st.x);
	//ALBEDO = vec3(height*step(normalized.x, line)
		//+height2*step(line, st.x)*step(normalized.x, line) + height2*step(line, normalized.x)*step(st.x, line)
		//+height3*step(line, normalized.x)
	//);
	ALBEDO = vec3(funky(st));
}

//void light() {
// // Called for every pixel for every light affecting the material.
// // Uncomment to replace the default light processing function with this one.
//}
