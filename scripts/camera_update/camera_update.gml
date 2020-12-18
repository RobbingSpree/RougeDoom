/// @param x
/// @param y
/// @param z
/// @param dir
/// @param yaw
/// @param [fov]
function camera_update(_x, _y, _z, _dir, _yaw){
	
	if !instance_exists(objCamera)
		instance_create_depth(0, 0, 0, objCamera);
	
	with (objCamera) {
		
		x = _x;
		y = _y;
		
		mLookat = matrix_build_lookat(_x, _y, _z,
		_x+dsin(_dir)*dcos(_yaw), _y+dcos(_dir)*dcos(_yaw), _z+dsin(_yaw),
		0, 0, -1);
		camera_set_view_mat(view_camera[0], mLookat);
		
		if argument_count > 5 {
			var projMat = matrix_build_projection_perspective_fov(-argument[5], view_get_wport(0)/view_get_hport(0), 1, 32000);
			camera_set_proj_mat(view_camera[0], projMat);
		}
		
		
		// set audio listener position and orientation
		audio_listener_set_position(0, _x, _y, _z-49);
		audio_listener_set_orientation(0, dsin(_dir)*dcos(_yaw), dcos(_dir)*dcos(_yaw), dsin(_yaw), 0, 0, -1);
		
		
	}
	
}