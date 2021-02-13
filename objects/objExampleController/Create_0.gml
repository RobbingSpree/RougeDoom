dir = 90;
yaw = 0;
//image_alpha = 0;
visible = false;

tick = 0;

//game features
hp = 50;
l_gun = global.leftgun;
r_gun = global.rightgun;
l_cool = 0;
r_cool = 0;

// Mouse sensitivity
sensitivity = 0.125;

spd = 2;


//debug
//l_gun = new gun();
l_gun._parent = self;
l_gun.movement_type = "projectile";

//r_gun = new gun();
r_gun._parent = self;
r_gun.movement_type = "hitscan";
shoot_dir = 0;
shoot_height =16;

/*

This is just an example controller object,
it's recommended to replace this with your own!

Sorry if this code is messy or undocumented~

*/


// a small check, not neccesarry if you don't refer to objCamera;
camera_update(x, y, 0, 0, 0);



