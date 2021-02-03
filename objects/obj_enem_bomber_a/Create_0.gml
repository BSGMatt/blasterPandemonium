/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
/// @description Init variables
// You can write your code in this editor
randomise();
myWeapon = noone;
maxHealth = 100;
hp = maxHealth;
killP = 200;//points given when player kills enemy
maxSpeed = 3;
mspeedX = maxSpeed; 
mspeedY = maxSpeed;
moveX = 0;
moveY = 0;
radius = 250;
onPath = true;
myPath = path_basic;
path_start(myPath,maxSpeed,path_action_continue,false);
au_emit = audio_emitter_create();
audio_emitter_position(au_emit,x,y,0);
minCoinVal = 20;
maxCoinVal = 25;
//DEFINING WEAPON PROPERTIES
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_bomber);
myWeapon.damage = 5;
myWeapon.blastDmgTick = 6;
myWeapon.blastDamage = 4;
myWeapon.fireRate = 1.3*room_speed;
myWeapon.blastDuration = 0.5*room_speed;
myWeapon.blastRadius = 2.5;
myWeapon.pelletVelocity = 20;
myWeapon.pelletLifeTime = 1*room_speed;
//
killP = 300;
mySound = sfx_enem_bomber
audio_play_sound(mySound,99,false);
facingDirection = 0;
