/// @description Insert description here
// You can write your code in this editor
#macro CRYSTAL_SNAP 64
if(!place_snapped(CRYSTAL_SNAP, CRYSTAL_SNAP)){
	move_snap(CRYSTAL_SNAP,CRYSTAL_SNAP);	
}
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_crystal);
myWeapon.damage = 10;
myWeapon.fireRate = 1*room_speed;
myWeapon.pelletVelocity = 35;

target = noone;
targetAvail = false;
minDist = 10000;
enemyInField = array_create(32,noone);
radius = 512;
myColor = c_white;

healing = false;
healTimer = 0;
healTime = 1*room_speed;
dead = false;
gotHit = false;

iFrames = 0;
maxIFrames = room_speed/4;
invincible = false;