/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxSpeed = 5;
maxHealth = 150;
minCoinVal = 30;
maxCoinVal = 40;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_bomber);
myWeapon.damage = 10;
myWeapon.blastDmgTick = 3;
myWeapon.blastDamage = 6;
myWeapon.fireRate = 1.5*room_speed;
myWeapon.blastDuration = 0.75*room_speed;
myWeapon.blastRadius = 4;
myWeapon.pelletVelocity = 20;

killP = 850;

