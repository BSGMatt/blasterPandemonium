/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
myWeapon.spread = irandom(weaponSpread);
/// @description - MAIN
// You can write your code in this editor
//finding target
minDist = 10000;
for(var i=0; i < instance_number(obj_block); i++){
		var inst = instance_find(obj_block,i);	
		if(inst.fromBuilder = true && distance_to_object(inst) <= minDist) {//dont want it to target map geometery
			minDist = distance_to_object(inst);
			target = inst;
			targetAvail = true;	
		}
}
if(!instance_exists(target)){
	target = obj_crystal;	
}

//Direction
enemy_update_direction(target);

//CONTROL STATUS EFFECTS
enemy_control_effects();

if(instance_exists(target)){
	mspeedX = maxSpeed*dcos(facingDirection);
	mspeedY = -maxSpeed*dsin(facingDirection);
}

//when you see my face hope it gives you hell
if(distance_to_object(target) <= spaceFromBlock){
	mspeedX = 0;
	mspeedY = 0;
}

//COLLISION
//bullets
enemy_collide_with_projectiles();

///COLLISION
//Horizontal
enemy_collide_with_terrain();

enemy_push();

if(hp <= 0) {
	enemy_die();
}

//
