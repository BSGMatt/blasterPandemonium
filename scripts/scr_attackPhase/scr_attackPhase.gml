function scr_attackPhase() {

	if(global.currentEnemyKills >= global.ENEM_POP[global.WAVE]){
		if((global.WAVE+1)%5 == 0 && global.WAVE != 0){
			scr_toBoss();
		}else{
			scr_toIdle();	
		}
		//scr_toBoss();
	}

	if(global.plyHP <= 0){
		global.PLAYER_DIED = true;
	}

	if(global.WAVE > 24){
		healthPackTime = 60;
	}else if(global.WAVE > 18){
		healthPackTime = 30;
	}else if(global.WAVE > 12){
		healthPackTime = 20;
	}else if(global.WAVE > 6){
		healthPackTime = 15;
	}else{
		healthPackTime = 10;
	}

	//Healthpacks
	timer--;
	if(timer<0){
		instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_healthpack);
		timer = healthPackTime*room_speed;
	}
	
	//Calculate Block XP Bonus
	blockXPTimer--;
	if(blockXPTimer < 0){
		var blockCount = 0;
		for(var i = 0; i < instance_number(obj_block); i++){
			var inst = instance_find(obj_block,i);
			if(inst.fromBuilder) blockCount++;
		}
		global.xp += (blockCount*BLOCK_XP_BONUS);
		blockXPTimer = BLOCK_XP_BONUS_TIME;	
	}
	
	///LEVELS
	if(global.xp >= global.xpThreshold[global.plyLevel]){
		scr_level_up();
	}

	//tick fun meter
	var funTick = 0;
	if(global.FUN < 25){
		if(global.FUN < 20){
			if(global.FUN < 15){
				if(global.FUN < 10){
					if(global.FUN < 5){
						funTick = FUN_TICK_RATE;
					}else{
						funTick = FUN_TICK_RATE * 1.25;	
					}
				}else{
					funTick = FUN_TICK_RATE * 1.5;		
				}
			}else{
				funTick = FUN_TICK_RATE * 1.5;		
			}
		}else{
			funTick = FUN_TICK_RATE *	1.75;
		}
	}else{
		funTick = FUN_TICK_RATE * 2;
	}
	
	global.FUN -= funTick;

	//"FUN" stuff
	if(global.FUN > MAX_FUN){
		global.FUN = MAX_FUN;
	}else if(global.FUN < 0){
		global.FUN = 0;	
	}
	
	//Block XP Bonuses
	

	if(global.PLAYER_DIED){
		if(global.CRYSTAL_HP > 0){
			if(instance_exists(obj_player)) instance_deactivate_object(obj_player);	
			respawnTimer--;
			if(respawnTimer <= 0){
				instance_activate_object(obj_player);	
				//RESET PLAYER STATS
				global.xp = 0;
				global.plyHP = global.plyMaxHP;
				//
				do{
					obj_player.x = irandom_range(obj_spawnPointA.x,obj_spawnPointB.x);
					obj_player.y = irandom_range(obj_spawnPointA.y,obj_spawnPointB.y);	
				}until(place_free(obj_player.x,obj_player.y));
				global.PLAYER_DIED = false;
				respawnTimer = playerRespawnTime;
			}		
		}
	}
	


}
