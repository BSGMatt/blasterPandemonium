/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxHealth = 125;
hp = maxHealth;
maxSpeed = 6;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enem_auto);
myWeapon.pelletCount = 1;
myWeapon.pelletVelocity = 25;
myWeapon.spread = irandom_range(-5,5);
myWeapon.damage = 2;
myWeapon.fireRate = 0.4*room_speed;
killP = 225;
