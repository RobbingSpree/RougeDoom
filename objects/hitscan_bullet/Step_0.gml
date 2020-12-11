/// @description Insert description here
// You can write your code in this editor

if setup{
	max_fade = fade;
	setup=false;
}

ttl--
if hit == false{
	var cycle = 1; //can change to check every 2nd or 3rd pixle for collision for performance increase
	for (var i=0; i<spd; i+=cycle) {
		cur_x += lengthdir_x(cycle,dir);
		cur_y += lengthdir_y(cycle,dir);
		if instance_position(cur_x,cur_y,enemy_parent) {
			hit = true;
			//deal dmg to target
		}
	}
	start_x += lengthdir_x(spd/7,dir);
	start_y += lengthdir_y(spd/7,dir);
	
	if ttl <= 0 {
		fade--
	}
	
} else 
	fade--


if fade <=0 
	instance_destroy(self);