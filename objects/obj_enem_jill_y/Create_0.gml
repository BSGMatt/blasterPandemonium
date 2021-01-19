/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//DEFINE WEAPON PROPERTIES
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enem_auto);
myWeapon.hasExplosive = true;
myWeapon.spread = 15;
myWeapon.damage = 20;
myWeapon.pelletCount = 5;
myWeapon.fireRate = 0.4*room_speed;
myWeapon.blastDamage = 25;
myWeapon.blastDmgTick = 0.25*room_speed;
myWeapon.blastDuration = 2*room_speed;
//
maxSpeed = 3;
maxHealth = 225;
spaceFromCrystal = 512;
killP = 1000;
//This code right determines the direction the enemy will go, basically replace the key inputs the player has.
direction = point_direction(x,y,obj_crystal.x,obj_crystal.y);
path_end();