/// @description Insert description here
// You can write your code in this editor
size = 4;
unit = 32; //length of one wall segment at scale 1
occupants = irandom_range(3,6);
hcount = 0;
vcount = 0;
//assume thos object is in middle of room

//find top left position
var xx = x-size*unit/2;
var yy = y-size*unit/2;
//make north and west walls 
for (var i=0; i<size; i++) {
	if irandom(size-hcount) > 0 {
		var wol_h = instance_create_layer(xx+i*unit,yy,"inst",objSpinWall);
		//wol_h.rotation = 45;
		hcount++
	}	
	if irandom(size-vcount) > 0 {
		var wol_v = instance_create_layer(xx,yy+i*unit,"inst",objSpinWall);
		//wol_v.rotation = 90;
		vcount++
	}
}

hcount = 0;
vcount = 0;
//find bottom right position
xx += size*unit;
yy += size*unit;
//make south and east walls
for (var i=size; i!=0; i--) {
	if irandom(size-hcount) > 0 {
		var wol_h = instance_create_layer(xx-i*unit,yy,"inst",objSpinWall);
		//wol_h.rotation = 90;
		hcount++
	}
	if irandom(size-vcount) > 0 {
		var wol_v = instance_create_layer(xx,yy-i*unit,"inst",objSpinWall);
		//wol_v.rotation = 90;
		vcount++
	}
}

//fill with enemies
for (var i=occupants; i>0; i--) {
	xx = (x-size*unit/2)+(irandom_range(0.5,size*2-0.5)*unit/2);
	yy = (y-size*unit/2)+(irandom_range(0.5,size*2-0.5)*unit/2);
	instance_create_layer(xx,yy,"inst", enemy_parent);
}

instance_destroy(self);