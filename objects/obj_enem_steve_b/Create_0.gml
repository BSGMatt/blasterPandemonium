/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxHealth = 250;
hp = maxHealth;
maxSpeed = 3;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enem_manual);
myWeapon.pelletCount = 8;
myWeapon.spread = 60;
myWeapon.damage = 10;
myWeapon.fireRate = 1.75*room_speed;
killP = 300;