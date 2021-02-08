/// @description Insert description here
// You can write your code in this editor

if mouse_x >= x && mouse_x <= x+image_xscale*sprite_width && mouse_y >= y && mouse_y <= y + image_yscale*sprite_height {
	if !hidden && mouse_check_button_pressed(mb_left)
		room_goto(rmroom_gen);
}
