tick++;


if window_has_focus() {
	
	var xmid = window_get_width()/2;
	var ymid = window_get_height()/2;
	
	if tick > 2 {
		dir -= (window_mouse_get_x() - xmid) * sensitivity;
		yaw += (window_mouse_get_y() - ymid) * sensitivity;
		yaw = clamp(yaw, -70, 70);
	}
	
	window_mouse_set(xmid, ymid);
	
}

#region movement and collisions
	
	
	
	var xspd = (global.kRight - global.kLeft);
	var yspd = (global.kDown - global.kUp);
	
	
	
	var _d = 180+point_direction(0, 0, xspd, yspd) + dir;
	var _s = (xspd!=0 || yspd!=0)*spd;
	
 
	var xtarg = x + lengthdir_x(_s, _d);
	var ytarg = y + lengthdir_y(_s, _d);
 
	if !wall_meeting(xtarg, ytarg) {
	    x = xtarg;
	    y = ytarg;
	} else {
		
	    var sweep_amt = 4;
		var _break = false;
    
	    for ( var angle = sweep_amt; angle <= 70; angle += sweep_amt) {
	        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
	            var angle_to_check = _d+(angle*multiplier);
	            xtarg = x+lengthdir_x(_s, angle_to_check);
	            ytarg = y+lengthdir_y(_s, angle_to_check);     
	            if !wall_meeting(xtarg, ytarg) {
	                x = xtarg;
	                y = ytarg;
	                _break = true;
					if _break { break; }
	            }
	        }
			if _break { break;}
	    }

	}
	
	
	
	
	
#endregion


camera_update(lerp(x, objCamera.x, 0.2), lerp(y, objCamera.y, 0.2), -16, dir, yaw, 60 - keyboard_check(vk_space)*50);
set_fog($6B513B, 20, 180);
set_snapping(1, 16, false);

