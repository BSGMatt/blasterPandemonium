/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxHealth = 175;
hp = maxHealth;
mspeed = 2;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enemy);
myWeapon.ammoK = 100;
myWeapon.ammo = myWeapon.ammoK;
myWeapon.pelletCount = 8;
myWeapon.spread = 60;
myWeapon.damage = 8;
myWeapon.fireRate = 2*room_speed;
facingDirection = 361;

//EFFECTS
facingDirection = 0;
effect = CharacterEffect.NORMAL;
effectVal = 1;
effectTimer = 0;
effectChanged = false;
