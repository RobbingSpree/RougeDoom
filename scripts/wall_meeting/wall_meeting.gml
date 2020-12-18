///@param x
///@param y
function wall_meeting(_x, _y) {
	
	var _xx = x;
	var _yy = y;
	
	x += _x-x;
	y += _y-y;
	
	
	var _o = id;
	
	
	var _meet = false;
	with (parWall) {
		
		if collision_line(x, y,
		x+lengthdir_x(sprite_width, image_angle),
		y+lengthdir_y(sprite_width, image_angle),
		_o, false, false) {
		
			_meet = true;
			break;
			
		
		}
	}
	
	
	x = _xx;
	y = _yy;
	
	
	return _meet;
	
	
}