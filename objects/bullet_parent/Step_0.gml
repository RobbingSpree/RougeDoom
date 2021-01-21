/// @description Insert description here
// You can write your code in this editor
image_angle = dir;

if hit == false {
	var temp_x = x;
	var temp_y = y;
	var cycle = 4; //can change to check every nth pixle for collision for performance increase
	for (var i=0; i<spd; i+=cycle) {
		temp_x += lengthdir_x(cycle,dir);
		temp_y += lengthdir_y(cycle,dir);
		
		
		if wall_meeting(temp_x,temp_y)
		{
			if second_frame_check == 2 {
				hit = true;
				x = temp_x;
				y = temp_y;
				break;
			}
			second_frame_check ++;
		} 
		
		if foe_meeting(temp_x,temp_y) {
			var target = instance_position(temp_x,temp_y,enemy_parent);
			if target != noone {
				target = instance_nearest(temp_x,temp_y,enemy_parent);
				hit = true;
				//deal dmg to target
				target.hp -= dmg;
				x = temp_x;
				y = temp_y;
				break;
			}
		}
		
		
		
	}
	x+= lengthdir_x(spd,dir);
	y+= lengthdir_y(spd,dir);

} 

if hit == true {
	ttl=0;
}


ttl--
if ttl <= 0
	instance_destroy(self);