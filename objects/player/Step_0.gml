/// @description Insert description here
// You can write your code in this editor

if keyboard_check(vk_left) || keyboard_check(ord("A")) left = true;
if keyboard_check(vk_right) || keyboard_check(ord("D")) right = true;
if keyboard_check(vk_up) || keyboard_check(ord("W")) up = true;
if keyboard_check(vk_down) || keyboard_check(ord("S")) down = true;
if keyboard_check_pressed(vk_space) {
	l_gun = new gun();
	l_gun.parent = self;
}

if l_gun != noone && mouse_check_button(mb_left) && l_cool <= 0 {
	l_gun.shoot();
	l_cool = l_gun.tts;
}

if l_cool > 0
	lcool--;

var vert_mov = (down-up)*spd;
var hor_mov = (right-left)*spd;

x+=hor_mov;
y+=vert_mov;

crosshair_dir = point_direction(x,y,mouse_x,mouse_y);
crosshair_len = distance_to_point(mouse_x,mouse_y);
cross_x = mouse_x;
cross_y = mouse_y;
if crosshair_len > crosshair_maxlen {
	cross_x = x + lengthdir_x(crosshair_maxlen,crosshair_dir);
	cross_y = y + lengthdir_y(crosshair_maxlen,crosshair_dir);
}