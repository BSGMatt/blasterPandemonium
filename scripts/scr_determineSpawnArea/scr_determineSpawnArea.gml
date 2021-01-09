function scr_determineSpawnArea() {


	//DETERMINE WHAT ENEMIES WILL SPAWN WHEN
	if(global.WAVE > 24){
		lower = 14;
		higher = 19;
	}else if(global.WAVE > 18){
		lower = 8;
		higher = 19;
	}else if(global.WAVE > 12){
		lower = 0;
		higher = 19;
	}else if(global.WAVE > 6){
		lower = 0;
		higher = 12;
	}else{
		lower = 0;
		higher = 7;
	}

	//
	rand = irandom_range(lower,higher);
	//rand = 1;
	switch(rand){
		
		///EASY ENEMIES
		
		case 0:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve);
		break;
		
		case 1:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_wanderer_y);
		break;
		
		case 2:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_joe);
		break;
		
		case 3:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_tax);
		break;
	
		case 4:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jack);
		break;
	
		case 5:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_bomber);
		break;
	
		case 6:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jill);
		break;
		
		///MEDIUM ENEMIES
	
		case 7:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_walt);
		break;
	
		case 8:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve_b);
		break;
		
		case 9:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_joe_b);
		break;
	
		case 10:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jack_b);
		break;
	
		case 11:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_bomber_b);
		break;
	
		case 12:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jill_b);
		break;
		
		case 13:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_tax_b);
		break;
	
		case 18:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve_y);
		break;
		
		///HARD ENEMIES
	
		case 14:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_joe_y);
		break;
	
		case 15:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jack_y);
		break;
	
		case 16:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_bomber_y);
		break;
	
		case 17:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jill_y);
		break;
		
		case 19:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_tax_y);
		break;
		
		default:
			instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve);
		break;
		
	}



}
