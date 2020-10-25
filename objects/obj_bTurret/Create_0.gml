/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
myWeapon = noone;
wepDamage = 4;
wepFR = 1*room_speed;
if(room == room_main){
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_turret);
myWeapon.damage = wepDamage;
myWeapon.fireRate = wepFR;
myWeapon.delay = irandom_range(room_speed/2,room_speed);
}
blockID = buildingID.turret_std;
target = noone;
targetAvail = false;
minDist = 10000;
enemyInField = array_create(32,noone);
radius = 256;
myColor = c_white;
event_inherited();
block_max_hp = 1000;
hp = block_max_hp;

