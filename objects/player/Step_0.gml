/// @description Insert description here
// You can write your code in this editor

left = keyboard_check(vk_left) || keyboard_check(ord("A"));
right = keyboard_check(vk_right) || keyboard_check(ord("D"));
up = keyboard_check(vk_up) || keyboard_check(ord("W"));
down = keyboard_check(vk_down) || keyboard_check(ord("S"));
if keyboard_check_pressed(vk_space) {
	l_gun = new gun();
	l_gun._parent = self;
	l_gun.movement_type = "projectile";
}
if keyboard_check_pressed(vk_control) {
	r_gun = new gun();
	r_gun._parent = self;
	r_gun.movement_type = "hitscan";
}

if l_gun != noone && mouse_check_button(mb_left) && l_cool <= 0 {
	l_gun.shoot();
	l_cool = l_gun.tts;
}
if r_gun != noone && mouse_check_button(mb_right) && r_cool <= 0 {
	r_gun.shoot();
	r_cool = r_gun.tts;
}

if l_cool > 0
	l_cool--;
if r_cool > 0
	r_cool--;

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