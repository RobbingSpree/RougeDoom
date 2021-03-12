/// @description Insert description here
// You can write your code in this editor

timer--
objCamera.ceil_height = -64;

if timer <=0 {
	var inst = instance_find(objWall, irandom(instance_number(objWall) - 1));
	with (inst)
		instance_change(objDoor,true);
	instance_destroy(self);
}