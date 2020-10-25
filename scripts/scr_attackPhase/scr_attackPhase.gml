function scr_attackPhase() {

	if(global.currentEnemyKills >= global.ENEM_POP[global.WAVE]){
		scr_toBoss();
	}

	if(global.plyHP <= 0){
		global.PLAYER_DIED = true;
	}

	//Generate healthpacks
	timer--;
	if(timer <= 0){
	instance_create_layer(irandom_range(obj_spawnPointA.x,obj_spawnPointB.x),irandom_range(obj_spawnPointA.y,obj_spawnPointB.y),"instance_layer",obj_healthpack);
	timer = packRespawnTime;
	}
	
	///LEVELS
	if(global.xp >= global.xpThreshold[global.plyLevel]){
		scr_level_up();
	}

	//tick fun meter
	global.FUN -= FUN_TICK_RATE;

	//"FUN" stuff
	if(global.FUN > MAX_FUN){
		global.FUN = MAX_FUN;
	}else if(global.FUN < 0){
		global.FUN = 0;	
	}

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
