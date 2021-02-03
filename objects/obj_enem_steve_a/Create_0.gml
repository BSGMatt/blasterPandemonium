/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxHealth = 175;
hp = maxHealth;
mspeed = 2;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_steve);
myWeapon.pelletCount = 8;
myWeapon.spread = 60;
myWeapon.damage = 8;
myWeapon.fireRate = 2*room_speed;
facingDirection = 361;