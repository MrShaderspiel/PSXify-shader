#ifdef AFFINE_MAPPING_EMU
	
	//gl_Position /= gl_Position.w;
	
	// vertex_mv is the vertex in view-space (i.e. viewMatrix * modelMatrix * vertex)
	
	vec4 vertex_mv = vertex * gbufferModelView;
	float dist = length(vertex_mv);
	affine = dist + ((vertex.w * 8.0) / dist) * 0.5;
	texcoord = texcoord * affine;

#endif
