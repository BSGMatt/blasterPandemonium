/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
type = weaponType.manual;
event_inherited();
damage = 5;
blastDamage = 8;
blastDmgTick = 6;
blastDuration = 0.5*room_speed;
blastShakeAngle = 0.3;
fireRate = 1.2*room_speed;
blastRadius = 2.5;
pelletVelocity = 20;
hasExplosive = true;
nickname = "Bomb";
pelletType = obj_bullet_explosive;
shakeAngle = 0.5;
shakeTime = 0.1*room_speed;
mySound = sfx_bullet_small;