/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//DEFINE WEAPON
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enemy);
myWeapon.ammoK = 100;
myWeapon.ammo = myWeapon.ammoK;
myWeapon.spread = 30;
myWeapon.damage = 2;
myWeapon.pelletCount = 9;
myWeapon.fireRate = 1.25*room_speed;
//
maxSpeed = 6;
maxHealth = 150;
killP = 350;
minCoinVal = 90;
maxCoinVal = 110;

target = noone;
targetAvail = false;
minDist = 10000;
spaceFromBlock = 128;
//This code right determines the direction the enemy will go, basically replace the key inputs the player has.
direction = 0;
facingDirection = 0;
path_end();