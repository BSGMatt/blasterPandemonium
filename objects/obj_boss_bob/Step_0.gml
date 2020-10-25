/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(swapTimer <= 0){
	var tarSelect = irandom_range(0,1);
	switch(tarSelect){
		case 0:
		target = obj_player;
		if(instance_exists(target)) break;
		
		default:
		target = obj_crystal;
		break;
	}
	swapTimer = 5*room_speed;
}else{
	swapTimer--;	
}
event_inherited();

