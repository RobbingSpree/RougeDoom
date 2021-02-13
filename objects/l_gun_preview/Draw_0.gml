/// @description Insert description here
// You can write your code in this editor

var left = x;
var top = y;
var right = x+sprite_width;
var bottom = y+sprite_height;
var sprite = gun_preview_spr;
var tint = c_white;
var opacity = 1;

if selected 
	nineSlice(left-4,top-4,right+4,bottom+4,gun_preview_sel_spr, tint, opacity)
nineSlice(left,top,right,bottom,sprite, tint, opacity)

draw_set_font(tiny_font);
draw_text(x+2,y+2,contents);
draw_sprite(contents.pick_spr(contents._pic),ani,x+30,y+120);
draw_set_font(defont);

//draw contents
