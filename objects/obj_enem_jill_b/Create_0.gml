/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//DEFINE WEAPON PROPERTIES
myWeapon.spread = 15;
myWeapon.damage = 15;
myWeapon.pelletCount = 3;
myWeapon.fireRate = 0.4*room_speed;
//
maxSpeed = 3;
maxHealth = 225;
spaceFromCrystal = 384;
killP = 650;
//This code right determines the direction the enemy will go, basically replace the key inputs the player has.
direction = point_direction(x,y,obj_crystal.x,obj_crystal.y);
path_end();