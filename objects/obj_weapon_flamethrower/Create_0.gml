/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
type = weaponType.auto;
event_inherited();
pelletLifeTime = 0.4*room_speed;
fireRate = 0.1*room_speed;
blastDmgTick = 3;
blastDamage = 2;
blastDuration = 0.1*room_speed;
pelletCount = 10;
blastRadius = (fireRate + (pelletVelocity * pelletLifeTime)) / (64*pelletCount);
mySound = sfx_reload_loop;
ammoK = 200;
nickname = "Flambo";