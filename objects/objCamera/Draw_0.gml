


shader_set(shader_to_use);


var _s_bayer = shader_get_sampler_index(shader_to_use, "uBayer");
texture_set_stage(_s_bayer, sprite_get_texture(sprDith, 0));



#region billboarding sprites


with (parEntity) {
	var _dd = (point_direction(x, y, other.x, other.y)*billboard)+extra_rot;
    var mat = matrix_build(x, y, z, 90, -_dd-90, 0, 1, 1, 1);
    matrix_set(matrix_world, mat);
	
    draw_sprite_ext(sprite_index, image_index, 0, 0,
	image_xscale, image_yscale*-1, -image_angle, image_blend, image_alpha);
}


matrix_set(matrix_world, matrix_build_identity());


#endregion


with (parWall) {
	vertex_submit(vb_plane, pr_trianglelist, my_tex);
}

with (parPlane) {
	vertex_submit(vb_plane, pr_trianglelist, my_tex);
}




shader_reset();