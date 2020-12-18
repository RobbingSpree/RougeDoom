

// Set the texture for the wall to use
my_tex = sprite_get_texture(sprite_index, image_index);


// How many pixels in X and Y the wall will automatically snap
// This is to make the editor less precises
#macro wall_snap 4


#region nerd stuff

// Rescale the image based on the editor image
image_xscale *= (sprite_get_width(sprEditorWall) / sprite_get_width(sprite_index));
visible = false;


format = create_format();

// Create the vertex buffer
vb_plane = vertex_create_buffer();



// Calculate the x and y where the wall ends
// This makes editing rooms very easy
endx = round((x + lengthdir_x(sprite_width, image_angle))/wall_snap)*wall_snap;
endy = round((y + lengthdir_y(sprite_width, image_angle))/wall_snap)*wall_snap;





// Begin building the buffer using the format we made
vertex_begin(vb_plane, format);


#region first triangle


vertex_position_3d(vb_plane, x, y, -height);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 0);

vertex_position_3d(vb_plane, endx, endy, -height);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 0);

vertex_position_3d(vb_plane, x, y, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 1);


#endregion
#region second triangle


vertex_position_3d(vb_plane, x, y, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 1);

vertex_position_3d(vb_plane, endx, endy, -height);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 0);

vertex_position_3d(vb_plane, endx, endy, 0);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 1);


#endregion


vertex_end(vb_plane);


#endregion