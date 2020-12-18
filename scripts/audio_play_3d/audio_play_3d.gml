///@param soundid
///@param x
///@param y
///@param [volume]
///@param [pitch]
///@param [loops]
function audio_play_3d(_soundid, _x, _y){
	var _loops = false;
	if argument_count > 5 {
		_loops = argument[5];
	}
	var _s = audio_play_sound_at(_soundid, _x, _y, 0, 0, 0, 0, _loops, 1);
	if argument_count > 3 {
		audio_sound_gain(_s, argument[3], 0);
	}
	if argument_count > 4 {
		audio_sound_pitch(_s, argument[4]);
	}
	return _s;
}