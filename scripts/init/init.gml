/*
This script initializes the game-
It gets ran in the init room, when the game first starts.

It also contains some macros I use!

*/


// The game width and height in visible pixels!
#macro Gamewidth 256
#macro Gameheight 144

// We turn the 'z' variable a different color so it fits in with x and y
#macro z zZ


function init(){
	
	randomize();
	
	// Upscale the game's window so the pixels are visible!
	surface_resize(application_surface, Gamewidth, Gameheight);
	var _zoom = 3;
	window_set_size(Gamewidth * _zoom, Gameheight * _zoom);
	window_set_position(100, 100);
	
	// Create the global and persistent controller object
	instance_create_depth(0, 0, 0, game);
	
	room_goto_next();
	
}