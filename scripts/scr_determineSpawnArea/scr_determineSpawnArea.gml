function scr_determineSpawnArea() {
	
	randomize();
	

	//DETERMINE THE RANGE OF ENEMIES
	if(global.WAVE > 24){
		lower = 15;
		higher = 21;
	}else if(global.WAVE > 18){
		lower = 8;
		higher = 21;
	}else if(global.WAVE > 12){
		lower = 8;
		higher = 14;
	}else if(global.WAVE > 6){
		lower = 0;
		higher = 14;
	}else{
		lower = 0;
		higher = 7;
	}
	
	//DETERMINE WHERE ENEMIES WILL SPAWN
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
	//
	rand = irandom_range(lower,higher);
	//rand = 1;
	//PICK THE ENEMY TO SPAWN
	switch(rand){
		
		///EASY ENEMIES				
		case 1:
		enemy = obj_enem_wanderer_a;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_wanderer_a);
		break;
		
		case 2:
		enemy = obj_enem_joe;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_joe);
		break;
		
		case 3:
		enemy = obj_enem_tax;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_tax);
		break;
	
		case 4:
		enemy = obj_enem_jack;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jack);
		break;
	
		case 5:
		enemy = obj_enem_bomber;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_bomber);
		break;
	
		case 6:
		enemy = obj_enem_jill;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jill);
		break;		
	
		case 7:
		enemy = obj_enem_walt;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_walt);
		break;
		
		///MEDIUM ENEMIES
	
		case 8:
		enemy = obj_enem_steve_b;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve_b);
		break;
		
		case 9:
		enemy = obj_enem_joe_b;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_joe_b);
		break;
	
		case 10:
		enemy = obj_enem_jack_b;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jack_b);
		break;
	
		case 11:
		enemy = obj_enem_bomber_b;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_bomber_b);
		break;
	
		case 12:
		enemy = obj_enem_jill_b;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jill_b);
		break;
		
		case 13:
		enemy = obj_enem_tax_b;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_tax_b);
		break;
		
		case 14:
		enemy = obj_enem_wanderer_b;
		break;
	
		///HARD ENEMIES
	
		case 19:
		enemy = obj_enem_steve_y;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve_y);
		break;		
	
		case 15:
		enemy = obj_enem_joe_y;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_joe_y);
		break;
	
		case 16:
		enemy = obj_enem_jack_y;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jack_y);
		break;
	
		case 17:
		enemy = obj_enem_bomber_y;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_bomber_y);
		break;
	
		case 18:
		enemy = obj_enem_jill_y;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_jill_y);
		break;
		
		case 20:
		enemy = obj_enem_tax_y;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_tax_y);
		break;
		
		case 21:		
		enemy = obj_enem_wanderer_y;
		break;
		
		default:
			enemy = obj_enem_steve;
			//instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_enem_steve);
		break;
		
	}

	//SPAWN ENEMY
	instance_create_layer(spawnPoint.x+spawnOffsetX,spawnPoint.y+spawnOffsetY,"instance_layer",enemy);
}
