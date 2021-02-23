/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
maxHealth = 75;
hp = maxHealth;
mspeed = 4;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_enemy);
myWeapon.ammoK = 100;
myWeapon.ammo = myWeapon.ammoK;
myWeapon.pelletCount = 1;
myWeapon.pelletVelocity = 25;
myWeapon.spread = irandom_range(-5,5);
myWeapon.damage = 2;
myWeapon.fireRate = room_speed/2;
facingDirection = 0;

//EFFECTS
facingDirection = 0;
effect = CharacterEffect.NORMAL;
effectVal = 1;
effectTimer = 0;
effectChanged = false;
