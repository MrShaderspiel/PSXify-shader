#version 430 compatibility

varying vec2 lmcoord;
noperspective varying vec2 texcoord;
varying vec4 glcolor;

vec2 vertexResolution;

uniform mat4 gbufferModelView;
uniform sampler2D depthtex0;

#include "/lib/defines.glsl"

void main() {
	// Define gl_Position
	gl_Position = ftransform();
	
	// wobble wobble
	#ifdef VERTEX_SNAPPING
		vec4 vertex = gl_Position;
		vertex.xyz = gl_Position.xyz / gl_Position.w;
		vertex.x = floor(VERTEX_GRID_X * vertex.x) / VERTEX_GRID_X;
		vertex.y = floor(VERTEX_GRID_Y * vertex.y) / VERTEX_GRID_Y;
		vertex.xyz *= gl_Position.w;
		gl_Position = vec4(vertex.xyzw);
	#endif

	// Normal shader stuff
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	
	// Get color
	glcolor = gl_Color;
}
