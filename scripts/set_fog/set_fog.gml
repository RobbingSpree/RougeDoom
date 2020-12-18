/*

This updates the shader's fog color and distance

*/
///@param color
///@param distance
///@param thickness
function set_fog(_color, _fogoff, _fogdist){
	
	if !instance_exists(objCamera)
		instance_create_depth(0, 0, 0, objCamera);
	
	
	with (objCamera) {
		
		
	shader_set(shader_to_use);
	shader_set_uniform_f(shader_get_uniform(shader_to_use, "fog_color"), color_get_red(_color)/255, color_get_green(_color)/255, color_get_blue(_color)/255, 1.0);
	shader_set_uniform_f(shader_get_uniform(shader_to_use, "fog_end"), _fogdist);
	shader_set_uniform_f(shader_get_uniform(shader_to_use, "fog_offset"), _fogoff);
	shader_reset();
		
		
	}
	
	
	
}