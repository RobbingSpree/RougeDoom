// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nineSlice(left,top,right,bottom,sprite, tint, opacity) {
	///@ function draw_ninebox(left, top, right, bottom, sprite, tint, opacity)
	///@ param left
	///@ param top
	///@ param right
	///@ param bottom
	///@ param sprite
	///@ param tint
	///@ param opacity

	if (!sprite_exists(sprite)) return false;

	// Vett Sprite

	var sprite_size = sprite_get_height(sprite);

	if (sprite_get_width(sprite) != sprite_size)
	{
	    show_debug_message(sprite_get_name(sprite) + " cannot be NINEBOXed because it is not a perfect square.");
	    return false;
	}
	if not (sprite_size mod 3 == 0)
	{
	    show_debug_message(sprite_get_name(sprite) + " cannot be NINEBOXed because its pixel size is not divisible by three.");
	    return false;
	}
	var slice_size = sprite_size / 3;

	// Draw Fill

	var scale_x = ((right - slice_size) - (left + slice_size)) / slice_size;
	var scale_y = ((bottom - slice_size) - (top + slice_size)) / slice_size;
	draw_sprite_part_ext(sprite, 0, slice_size, slice_size, slice_size, slice_size, left + slice_size, top + slice_size, scale_x, scale_y, tint, opacity);

	// Draw Vertical Edges

	draw_sprite_part_ext(sprite, 0, 0, slice_size, slice_size, slice_size, left, top + slice_size, 1, scale_y, tint, opacity);
	draw_sprite_part_ext(sprite, 0, slice_size * 2, slice_size, slice_size, slice_size, right - slice_size, top + slice_size, 1, scale_y, tint, opacity);

	// Draw Horizontal Edges

	draw_sprite_part_ext(sprite, 0, slice_size, 0, slice_size, slice_size, left + slice_size, top, scale_x, 1, tint, opacity);
	draw_sprite_part_ext(sprite, 0, slice_size, slice_size * 2, slice_size, slice_size, left + slice_size, bottom - slice_size, scale_x, 1, tint, opacity);

	// Draw the Corners

	draw_sprite_part_ext(sprite, 0, 0, 0, slice_size, slice_size, left, top, 1, 1, tint, opacity);
	draw_sprite_part_ext(sprite, 0, slice_size * 2, 0, slice_size, slice_size, right - slice_size, top, 1, 1, tint, opacity);
	draw_sprite_part_ext(sprite, 0, 0, slice_size * 2, slice_size, slice_size, left, bottom - slice_size, 1, 1, tint, opacity);
	draw_sprite_part_ext(sprite, 0, slice_size * 2, slice_size * 2, slice_size, slice_size, right - slice_size, bottom - slice_size, 1, 1, tint, opacity);

	return slice_size;
}

function draw_center_text_over_object(text) {
	var xx = x+sprite_width/2;
	var yy = y+sprite_height/2;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(xx,yy,text);
	
	draw_set_halign(-1);
	draw_set_valign(-1);
}

