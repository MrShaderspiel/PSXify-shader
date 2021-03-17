#version 430 compatibility

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;
varying float affine;

vec2 vertexResolution;

uniform mat4 gbufferModelView;
uniform sampler2D depthtex0;

#include "/lib/defines.glsl"

void main() {
	// Define gl_Position
	gl_Position = ftransform();
	
	// wobble wobble
	#include "/lib/vertex_snapping.glsl"
	
	// warp warp
	#include "/lib/affine_mapping_emu.glsl"
	
	// Normal shader stuff
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	
	// Get color
	glcolor = gl_Color;
}
