/*




This shader made by Trixelized
Feel free to use in anything!




*/



const float BAYER_DIM = 8.0; // size of dither texture
const float DITHER_AMT = 0.001; // the intensity of ambient dithering



uniform vec2 game_size;

varying vec3 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;

varying float fog_depth;

uniform vec4 fog_color;
uniform float fog_end;
uniform float fog_offset;

uniform sampler2D uBayer;

uniform float cprec;

float getDither (vec2 pos)
{
    return texture2D(uBayer, fract(((pos * vec2(game_size.x,game_size.y))) / BAYER_DIM)).r;
}

void main() {
	
	vec2 uv = v_vTexcoord.xy / v_vTexcoord.z;
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
	
    vec3 ndc = v_vPosition.xyz / v_vPosition.w;
    vec2 screenUV = clamp((ndc.xy + 1.0) / 2.0, 0.0, 1.0);
	float dither = 0.02+getDither(screenUV)*0.96;
	
	if (gl_FragColor.a < (dither)){discard;}
	
	gl_FragColor = vec4(vec3(floor(mix(gl_FragColor+dither*0.01, fog_color, clamp(-(fog_depth/fog_end) - (fog_offset/fog_end), -1.0, 1.0))*cprec)/cprec), 1.0);
	
}
