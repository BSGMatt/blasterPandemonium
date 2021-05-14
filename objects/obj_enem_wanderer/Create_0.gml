/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
path_start(myPath,maxSpeed, myPathAction, true);
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enemy);
myWeapon.ammoK = 100;
myWeapon.ammo = myWeapon.ammoK;
myWeapon.spread = 30;
myWeapon.damage = 6;
myWeapon.pelletCount = 3;
myWeapon.fireRate = 1.25*room_speed;
