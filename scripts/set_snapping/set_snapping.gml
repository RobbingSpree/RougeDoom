/*

This updates the shader's snapping and distortion

*/
///@param snap_amt
///@param color_snap_amt
///@param do_warping
function set_snapping(_snap, _colsnap, _is_distort){
	
	if !instance_exists(objCamera)
		instance_create_depth(0, 0, 0, objCamera);
	
	
	with (objCamera) {
		
		
	shader_set(shader_to_use);
	shader_set_uniform_f(shader_get_uniform(shader_to_use, "prec"), _snap);
	shader_set_uniform_f(shader_get_uniform(shader_to_use, "cprec"), _colsnap);
	shader_set_uniform_f(shader_get_uniform(shader_to_use, "dodist"), _is_distort);
	shader_reset();
		
		
	}
	
	
	
}