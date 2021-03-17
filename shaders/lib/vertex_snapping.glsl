#ifdef VERTEX_SNAPPING

	// wobble wobble
	vec4 vertex = gl_Position;
	vertex.xyz = gl_Position.xyz / gl_Position.w;
	vertex.x = floor(VERTEX_GRID_X * vertex.x) / VERTEX_GRID_X;
	vertex.y = floor(VERTEX_GRID_Y * vertex.y) / VERTEX_GRID_Y;
	vertex.xyz *= gl_Position.w;
	gl_Position = vec4(vertex.xyzw);
	
#endif
