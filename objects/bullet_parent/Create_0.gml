// Inherit the parent event
event_inherited();

billboard = true;

dmg = 5;
allied = true; //able to damage a player or not
hurts_all = false; //logic check for enemey fired bullets that hurt other enemies
dir = 0; //direction shot in
spd = 3; //speed bullet travels
ttl = 20; //frames the bullet hangs around for before self destructing
hit = false; //flag for detecting collision
second_frame_check = false; //flag for doing a second collision check to porevent hit detection from behind
shooter = noone;

explode = splode_parent;
epl_spr = f_splode_1;
z = -12;
//z=objExampleController.shoot_height;