/// @description Insert description here
// You can write your code in this editor

if !hidden && flag != "neither" {
	if flag == "left" {
		global.leftgun = new gun();
	}
	if flag == "right" {
		global.rightgun = new gun();
	}
	room_goto(rmroom_gen);
}