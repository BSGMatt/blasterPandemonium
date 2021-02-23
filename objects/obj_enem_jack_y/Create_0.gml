/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxHealth = 150;
killP = 200;
//DEFINE WEAPON
myWeapon.spread = 20;
myWeapon.damage = 8;
myWeapon.pelletCount = 3;
myWeapon.fireRate = 1*room_speed;
//
maxSpeed = 9;
spaceFromCrystal = 384;
hp = maxHealth;
killP = 750;
//This code right determines the direction the enemy will go, basically replace the key inputs the player has.
direction = point_direction(x,y,obj_crystal.x,obj_crystal.y);
path_end();