#version 430 compatibility

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;
varying float affine;

#include "/lib/defines.glsl"

void main() {

	// Apply textures and color
	#ifdef AFFINE_MAPPING_EMU
		vec2 affineTexcoord = texcoord / affine;
		vec4 color = texture2D(texture, affineTexcoord) * glcolor;
	#endif
	#ifndef AFFINE_MAPPING_EMU
		vec4 color = texture2D(texture, texcoord) * glcolor;
	#endif

	// Apply lightmap
	color *= texture2D(lightmap, lmcoord);

	// Change color depth
	color = vec4((floor(color*COLOR_MAPPING_MODE)/COLOR_MAPPING_MODE));


/* DRAWBUFFERS:0 */
	gl_FragData[0] = color;
}
