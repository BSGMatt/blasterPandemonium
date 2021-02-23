/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
/// @description Insert description here
// You can write your code in this editor

//FIND CLOSEST TARGET
if(global.WAVE_PHASE == Phase.SWARM){
	minDist = 10000;
	for(var i=0; i < instance_number(obj_enemB); i++){
		var inst = instance_find(obj_enemB,i);	
		if(distance_to_object(inst) <= radius) {
			enemyInField[i] = inst;
			targetAvail = true;	
		}
	}
	for(var i=0; i < array_length(enemyInField); i++){
		var dist = distance_to_object(enemyInField[i]);
		if(dist < minDist){
			minDist = dist;
			target = enemyInField[i];
		}
	}
}else if(global.WAVE_PHASE = Phase.BOSS){
	if(instance_exists(obj_boss)) target = obj_boss;
}	

if(instance_exists(myWeapon)){
	myWeapon.x = x;
	myWeapon.y = y;
	if(instance_exists(target)) myWeapon.direction = point_direction(x,y,target.x,target.y);
}
event_inherited();

