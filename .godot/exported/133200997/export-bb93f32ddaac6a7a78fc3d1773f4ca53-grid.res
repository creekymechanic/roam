RSRC                    ShaderMaterial            ��������                                                  resource_local_to_scene    resource_name    code    script    render_priority 
   next_pass    shader     shader_parameter/affine_mapping    shader_parameter/alpha_scissor    shader_parameter/jitter    shader_parameter/resolution    shader_parameter/albedo       Shader    res://shaders/psx.gdshader ��������
   Texture2D    res://textures/grid.jpg �ٗ�K�i      local://Shader_edwod \         local://ShaderMaterial_kiaoi 7         local://ShaderMaterial_ucpm4 ~         Shader          �  shader_type spatial;
render_mode vertex_lighting, skip_vertex_transform, 
			specular_phong, diffuse_lambert_wrap;

uniform sampler2D albedo: hint_black_albedo;
uniform sampler2D specular: hint_black;
uniform sampler2D emission: hint_black;

uniform float jitter: hint_range(0.0, 1.0) = 0.5;
uniform bool jitter_z_coordinate = true;
uniform bool jitter_depth_independent = true;
uniform bool affine_texture_mapping = true;
uniform float alpha_scissor: hint_range(0.0, 1.0) = 1.0;

void vertex() {
	VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	
	float z_orig = VERTEX.z;
	float i = (1.0 - jitter) * min(VIEWPORT_SIZE.x, VIEWPORT_SIZE.y) / 2.0;
	
	if (jitter_depth_independent) {
		float w = (PROJECTION_MATRIX * vec4(VERTEX, 1.0)).w;
		VERTEX = round(VERTEX / w * i) / i * w;
	} else {
		VERTEX = round(VERTEX * i) / i;
	}
	
	if (!jitter_z_coordinate) {
		VERTEX.z = z_orig;
	}

	if (affine_texture_mapping) {
		UV *= VERTEX.z;
	}
}

void fragment() {
	vec2 uv = UV;
	
	if (affine_texture_mapping) {
		uv /= VERTEX.z;
	}
	
	ALBEDO = texture(albedo, uv).rgb;
	ALPHA = texture(albedo, uv).a;
	ALPHA_SCISSOR = alpha_scissor;
	EMISSION = texture(emission, uv).rgb;
	SPECULAR = texture(specular, uv).r;
}          ShaderMaterial                                              ShaderMaterial 	                                                  )   ��Q��?	          
   -   �  8                    RSRC