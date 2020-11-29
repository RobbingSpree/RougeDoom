// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun() constructor{
	clip_size = irandom_range(6,24);
	ammo_type = new ammo(self);
	name = string(ammo_type.dmg*15) + "Calibre Mess Maker";
}

function ammo(parent) constructor{
	dmg = irandom_range(1,10);
	clip_penalty = 0;
	if dmg > 5
		clip_penalty = dmg-5;
	parent.clip_size -= clip_penalty;
}
