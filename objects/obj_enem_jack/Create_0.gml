/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//DEFINE WEAPON
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enemy);
myWeapon.ammoK = 100;
myWeapon.ammo = myWeapon.ammoK;
myWeapon.spread = 30;
myWeapon.damage = 6;
myWeapon.pelletCount = 3;
myWeapon.fireRate = 1.25*room_speed;
//
maxSpeed = 6;
spaceFromCrystal = 256;
maxHealth = 150;
killP = 350;
//This code right determines the direction the enemy will go, basically replace the key inputs the player has.
direction = point_direction(x,y,obj_crystal.x,obj_crystal.y);
facingDirection = 0;
path_end();