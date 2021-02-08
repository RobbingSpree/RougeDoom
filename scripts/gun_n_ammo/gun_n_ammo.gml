// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun() constructor{
	clip_size = irandom_range(6,24);
	current_clip = clip_size;
	//ammo_type = new ammo(self);
	tts = 30;
	reload_delay = 120;
	bullet_life = irandom_range(300,500);
	trail_fade = 30;
	_pic = irandom(13);
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
	_name = string(dmg*15) + "Calibre Mess Maker";
	_parent = noone;
	
	static shoot = function (_dir,_x,_y) {
		if _parent == noone
			return false;
		/*
		if movement_type == "hitscan" {
			var bull = instance_create_layer(_parent.x,_parent.y,"inst",hitscan_bullet);
			bull.start_x = _parent.x;
			bull.start_y = _parent.y;
			bull.cur_x = bull.start_x;
			bull.cur_y = bull.start_y;
			bull.fade = trail_fade;
			bull.dmg = max(dmg-5,1);
		} else {
			var bull = instance_create_layer(_parent.x,_parent.y,"inst",proj_bullet);
			bull.ttl = bullet_life;
			bull.dmg = dmg;
			bull.spd = spd;
			bull.sprite_index = pick_spr(irandom(0));
			bull.image_xscale = 0.5;
			bull.image_yscale = 0.5;
		}
		*/
		var x_offset = lengthdir_x(_parent.sprite_width,_dir);
		var y_offset = lengthdir_y(_parent.sprite_height,_dir);
		
		var bull = instance_create_layer(_x+x_offset,_y+y_offset,"inst",proj_bullet);
		bull.sprite_index = pick_spr(_pic);
		bull.image_xscale = 0.5;
		bull.image_yscale = 0.5;
		bull.ttl = bullet_life;
		bull.shooter = _parent;
		bull.allied = true;
		
		if _parent != player
			bull.allied = false;
		//hurts_all = false;//not changed for now
		bull.dir = _dir-90; 
		_parent.shoot_dir = bull.dir;
	}
	
	static toString = function () {
		return _name +"\n" + "Clip Size: " + string(clip_size) +"\n" + "Damage: " + string(dmg) +"\n" + "Ammo Type: " + movement_type;
	}
	
	static pick_spr = function (index) {
	switch (index) {
		case 0: return shot_1; break;
		case 1: return shot_2; break;
		case 2: return shot_3; break;
		case 3: return shot_4; break;
		case 4: return shot_5; break;
		case 5: return shot_6; break;
		case 6: return shot_7; break;
		case 7: return shot_8; break;
		case 8: return shot_9; break;
		case 9: return shot_10; break;
		case 10: return shot_11; break;
		case 11: return shot_12; break;
		case 12: return shot_13; break;
		case 13: return shot_14; break;
		default: return bullet_spr;
	}
}
	
}



