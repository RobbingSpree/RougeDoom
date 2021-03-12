// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pick_a_room_layout(){
	var room_destination = noone;
	
	switch (irandom(2)-1) {
		case 0: room_destination = big_empty_room; break;
		case 1: room_destination = small_rooms; break;
		default: room_destination = big_empty_room;
	}
	
	return room_destination;
}