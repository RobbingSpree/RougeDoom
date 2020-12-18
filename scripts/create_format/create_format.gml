/*

This script creates a format and adds information to vertexes
This is required for everything to render properly

Don't worry about it too much uvu

*/
function create_format(){
	
	vertex_format_begin();
	
	vertex_format_add_position_3d();	// Add 3D position info
	vertex_format_add_color();			// Add color info
	vertex_format_add_texcoord();		// Texture coordinate info
	
	// Return the format
	return vertex_format_end();
	
}