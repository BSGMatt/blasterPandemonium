// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_createHealthPacks(){
	switch(irandom_range(1,4)){
		default:
			spawnPoint = obj_spawnPointA;
		break;
		
		case 2:
			spawnPoint = obj_spawnPointB;
		break;
		
		case 3:
			spawnPoint = obj_spawnPointC;
		break;
		
		case 4:
			spawnPoint = obj_spawnPointD;
		break; 
	}
	
	
	spawnOffsetX = irandom_range(-128,128);
	spawnOffsetY = irandom_range(-128,128);
	
	instance_create_layer(spawnPoint.x+spawnOffsetX,spawnPoint.y+spawnOffsetY,"instance_layer",obj_healthpack);
}