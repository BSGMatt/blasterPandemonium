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
		audio_play_sound(sfx_reload_end, 100, false);
	}
	
	///LEVELS
	if(global.xp >= global.xpThreshold[global.plyLevel]){
		scr_level_up();
	}

	
	global.FUN -= global.FUN_TICK;

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
