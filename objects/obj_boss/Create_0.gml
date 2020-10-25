/// @description Init variables
// You can write your code in this editor
randomise();
myWeapon = noone;
maxHealth = 100;
hp = maxHealth;
killP = 100;//points given when player kills enemy
maxSpeed = 3;
mspeedX = maxSpeed; 
mspeedY = maxSpeed;
moveX = 0;
moveY = 0;
radius = 250;
onPath = true;
myPath = path_basic;
minCoinVal = 50;
maxCoinVal = 100;
if(instance_exists(obj_player)){
	target = obj_player;
}else{
	target = obj_crystal;	
}
path_start(myPath,maxSpeed,path_action_continue,false);
#macro	RETURN_TO_POINT_LEEWAY 64
distToNearestPoint = 100000;
