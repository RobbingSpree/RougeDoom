/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

ani_count++

if ani_count >= ani_spd {
	image_index++;
	if image_index > image_number
		image_index = 0;
}