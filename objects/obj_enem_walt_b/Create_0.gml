/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//DEFINE WEAPON
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enem_manual);
myWeapon.spread = 30;
myWeapon.damage = 3;
myWeapon.pelletCount = 9;
myWeapon.fireRate = 1.1*room_speed;
//
maxSpeed = 8;
maxHealth = 175;
killP = 350;

minCoinVal = 110;
maxCoinVal = 130;


target = noone;
targetAvail = false;
minDist = 10000;
spaceFromBlock = 128;
//This code right determines the direction the enemy will go, basically replace the key inputs the player has.
direction = 0;
facingDirection = 0;
path_end();