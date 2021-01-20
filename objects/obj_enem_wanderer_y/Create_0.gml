/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
path_end();

#macro TOLERANCE 64

//Create Weapon
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enem_manual);
myWeapon.fireRate = 0.1*room_speed;
myWeapon.reloadRate = 0.25*room_speed;
myWeapon.ammoK = 3;
myWeapon.damage = 40;
myWeapon.pelletCount = 1;