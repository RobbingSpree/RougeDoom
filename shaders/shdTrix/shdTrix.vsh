/*




This shader made by Trixelized
Feel free to use in anything!




*/

attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec3 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;

varying float fog_depth;

uniform bool dodist;

uniform float prec;

void main() {
	
    float v_precision = prec;
	
	vec4 pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
	
	vec4 viewPos = gm_Matrices[MATRIX_WORLD_VIEW] * pos;
	
	viewPos.xyz = floor((viewPos.xyz * v_precision) + vec3(0.5)) / vec3(v_precision);

	vec4 viewProj = gm_Matrices[MATRIX_PROJECTION] * viewPos;
	gl_Position = viewProj;
	
	v_vPosition = viewProj;

	vec2 uv = in_TextureCoord;
	
	if (dodist == true) {
		v_vTexcoord = vec3(uv * viewProj.w, viewProj.w);
	} else if (dodist == false) {
		v_vTexcoord = vec3(uv * viewPos.w, viewPos.w);
	}
	
	v_vColour = in_Colour;
	
	fog_depth = -viewPos.z;

}