shader_to_use = shdTrix; // What the shader to use is~


// The ceiling draw height
ceil_height = -32;

// Set the floor and ceiling layers
var _e = layer_get_id("ts_floor");
if layer_exists(_e) layer_depth(_e, 0);
var _e = layer_get_id("ts_ceil");
if layer_exists(_e) layer_depth(_e, ceil_height);


/*

==================================================

*/


#region shader setup


set_fog(0, 0, 200);
set_snapping(1, 16, true);

shader_set(shader_to_use);

shader_set_uniform_f(shader_get_uniform(shader_to_use, "game_size"), Gamewidth, Gameheight);
shader_reset();

#endregion



#region Set up 3d environment

/*

This bunch of code makes the 3d drawing possible
Don't worry about it too much uvu

*/


gpu_set_alphatestenable(false);
gpu_set_alphatestref(1);


gpu_set_zwriteenable(true); // Enables 3d render
gpu_set_ztestenable(true); // Depth sorting




// Make it so the shaders apply to the layers
layer_shader(layer_get_id("ts_floor"), shader_to_use);
layer_shader(layer_get_id("ts_ceil"), shader_to_use);



// View setup
view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, Gamewidth);
view_set_hport(0, Gameheight);

camera_set_view_size(view_camera[0], Gamewidth, Gameheight);


// Set up projection matrix
var projMat = matrix_build_projection_perspective_fov(-70, view_get_wport(0)/view_get_hport(0), 1, 32000);
camera_set_proj_mat(view_camera[0], projMat);

view_set_camera(0, view_camera[0]);


#endregion
