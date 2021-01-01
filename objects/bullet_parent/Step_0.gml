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
		
		/*
		var target = instance_position(temp_x,temp_y,parEntity)
		if target == shooter
			break;
		
		if target != noone && (target == enemy_parent || target == objWall) {
			hit = true;
			//deal dmg to target
			target.hp -= dmg;
			x = temp_x;
			y = temp_y;
			break;
		} 
		*/
		
		if wall_meeting(temp_x,temp_y)
		{
			hit = true;
			x = temp_x;
			y = temp_y;
			break;
		} else {
			var target = instance_position(temp_x,temp_y,parEntity);
			if target == enemy_parent {
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