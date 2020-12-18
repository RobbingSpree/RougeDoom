///@desc x1
///@desc y1
///@desc z1
///@desc x2
///@desc y2
///@desc z2
///@desc x3
///@desc y3
///@desc z3
///@desc x4
///@desc y4
///@desc z4
///@desc sprite
///@desc index
///@desc is_animated
function make_plane(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, _spr, _ind, _an){
	var _p = instance_create_depth(0, 0, 0, parPlane);
	with (_p) {
		
		image_speed = lerp(0, 1, _an);
		
		sprite_index = _spr;
		image_index = _ind;
		my_tex = sprite_get_texture(sprite_index, image_index);



		format = create_format();

		// Create the vertex buffer
		vb_plane = vertex_create_buffer();

		// Begin building the buffer using the format we made
		vertex_begin(vb_plane, format);



		#region coords

		vertex_position_3d(vb_plane, x1, y1, z1);
		vertex_color(vb_plane, c_white, 1);
		vertex_texcoord(vb_plane, 0, 0);

		vertex_position_3d(vb_plane, x2, y2, z2);
		vertex_color(vb_plane, c_white, 1);
		vertex_texcoord(vb_plane, 1, 0);

		vertex_position_3d(vb_plane, x3, y3, z3);
		vertex_color(vb_plane, c_white, 1);
		vertex_texcoord(vb_plane, 0, 1);

		vertex_position_3d(vb_plane, x3, y3, z3);
		vertex_color(vb_plane, c_white, 1);
		vertex_texcoord(vb_plane, 0, 1);

		vertex_position_3d(vb_plane, x2, y2, z2);
		vertex_color(vb_plane, c_white, 1);
		vertex_texcoord(vb_plane, 1, 0);

		vertex_position_3d(vb_plane, x4, y4, z4);
		vertex_color(vb_plane, c_white, 1);
		vertex_texcoord(vb_plane, 1, 1);

		#endregion

		vertex_end(vb_plane);


		
		
	}
	return _p;
}