/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
block_max_hp = 1000;
hp = block_max_hp;
isDestructible = true;
wepDamage = 4;
wepFR = 1*room_speed;
if(instance_exists(myWeapon)){
myWeapon.damage = wepDamage;
myWeapon.fireRate = wepFR;
myWeapon.delay = irandom_range(room_speed/2,room_speed);
}
blockID = buildingID.turret_std;
target = noone;
targetAvail = false;
minDist = 10000;
enemyInField = array_create(32,noone);
radius = 384;
myColor = c_white;

