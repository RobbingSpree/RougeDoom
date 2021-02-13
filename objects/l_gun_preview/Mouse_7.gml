/// @description Insert description here
// You can write your code in this editor
if selected == true {
	selected = false;
	confirm_btn.hidden = true;
} else {
	with l_gun_preview 
		selected = false;
	selected = true;
	confirm_btn.hidden = false;
	confirm_btn.flag = dir;
}