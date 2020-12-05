// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun() constructor{
	clip_size = irandom_range(6,24);
	current_clip = clip_size;
	//ammo_type = new ammo(self);
	tts = 30;
	reload_delay = 120;
	
	//bullet settings
	dmg = irandom_range(1,10);
	/*clip_penalty = 0;
	if dmg > 5
		clip_penalty = dmg-5;
	clip_size -= clip_penalty;*/
	movement_type = irandom(1)
		if movement_type == 1
			movement_type = "hitscan";
		else
			movement_type = "projectile";
		
	//generate name
	name = string(dmg*15) + "Calibre Mess Maker";
	parent = noone;
	
	static shoot = function () {
		if parent == noone
			return false;
		
		if movement_type == "hitscan"
			var bull = instance_create_layer(parent.x,parent.y,"Instances",hitscan_bullet);
		else
			var bull = instance_create_layer(parent.x,parent.y,"Instances",proj_bullet);
		bull.dmg = 5;
		bull.allied = true;
		if parent != player
			bull.allied = false;
		//hurts_all = false;//not changed for now
		bull.dir = parent.dir; 
		//spd = 3; //not changed for now
	}
	
	static toString = function () {
		return name +"\n"+ string(parent) +"\n" + "Clip Size: " + string(clip_size) +"\n" + "Damage: " + string(dmg);
	}
}

