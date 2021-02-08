/// @description Insert description here
// You can write your code in this editor
var left = x;
var top = y;
var right = x+sprite_width;
var bottom = y+sprite_height;
var sprite = gun_preview_spr;
var tint = c_white;
var opacity = 1;

nineSlice(left,top,right,bottom,sprite, tint, opacity)
draw_set_font(tiny_font);
draw_center_text_over_object("Replace A Gun");
draw_set_font(defont);