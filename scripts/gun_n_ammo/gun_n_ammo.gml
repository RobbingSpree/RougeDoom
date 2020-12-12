// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun() constructor{
	clip_size = irandom_range(6,24);
	current_clip = clip_size;
	//ammo_type = new ammo(self);
	tts = 30;
	reload_delay = 120;
	bullet_life = irandom_range(100,200);
	trail_fade = 30;
	//bullet settings
	dmg = irandom_range(1,10);
	spd = irandom_range(8,25);
	//bullet explosion type
	explode = splode_parent;
	epl_spr = f_splode_1;
	/*clip_penalty = 0;
	if dmg > 5
		clip_penalty = dmg-5;
	clip_size -= clip_penalty;*/
	movement_type = irandom(1)
		if movement_type == 1 {
			movement_type = "hitscan";
			bullet_life = floor(bullet_life/10);
		} else {
			movement_type = "projectile";
		}
		
	//generate name
	name = string(dmg*15) + "Calibre Mess Maker";
	_parent = noone;
	
	static shoot = function () {
		if _parent == noone
			return false;
		
		if movement_type == "hitscan" {
			var bull = instance_create_layer(_parent.x,_parent.y,"bullets",hitscan_bullet);
			bull.start_x = _parent.x;
			bull.start_y = _parent.y;
			bull.cur_x = bull.start_x;
			bull.cur_y = bull.start_y;
			bull.fade = trail_fade;
			bull.dmg = max(dmg-5,1);
		} else {
			var bull = instance_create_layer(_parent.x,_parent.y,"bullets",proj_bullet);
			bull.ttl = bullet_life;
			bull.dmg = dmg;
			bull.spd = spd;
			bull.sprite_index = pick_spr(irandom(0));
			bull.image_xscale = 0.5;
			bull.image_yscale = 0.5;
		}
		
		bull.allied = true;
		
		if _parent != player
			bull.allied = false;
		//hurts_all = false;//not changed for now
		bull.dir = _parent.crosshair_dir; 
		 
	}
	
	static toString = function () {
		return name +"\n" + "Clip Size: " + string(clip_size) +"\n" + "Damage: " + string(dmg) +"\n" + "Ammo Type: " + movement_type;
	}
	
	static pick_spr = function (index) {
		switch (index) {
			case 0: return shot_1; break;
			default: return bullet_spr;
		}
	}
}


