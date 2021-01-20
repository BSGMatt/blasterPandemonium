/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
path_end();

#macro TOLERANCE 64

//Create Weapon
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enem_manual);
myWeapon.fireRate = 0.25*room_speed;
myWeapon.damage = 5;
myWeapon.pelletCount = 1;
myWeapon.spread = 30;
myWeapon.hasExplosive = true;
myWeapon.blastDamage = 2;
myWeapon.blastDmgTick = 1;
myWeapon.blastDuration = 0.5*room_speed;
myWeapon.blastRadius = 1;
myWeapon.pelletLifeTime = 3*room_speed;