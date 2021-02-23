///This script determines the next wave	
function scr_toAttack() {
	global.enemyCount = global.ENEM_POP[global.WAVE];
	global.BUILDER_EN = false;
	global.currentEnemyKills = 0;
	if(global.WAVE > 24){
		seconds = 2;
	}else if(global.WAVE > 18){
		seconds = 2.25;
	}else if(global.WAVE > 12){
		seconds = 2.5;
	}else if(global.WAVE > 6){
		seconds = 3;
	}else{
		seconds = 4;
	}
	
	
	if(global.WAVE > 24){
		healthPackTime = 60;
	}else if(global.WAVE > 18){
		healthPackTime = 30;
	}else if(global.WAVE > 12){
		healthPackTime = 15;
	}else if(global.WAVE > 6){
		healthPackTime = 8;
	}else{
		healthPackTime = 4;
	}

	//Create Timeline for Enemy Spawns
	if(timeline_exists(tm_test)) timeline_clear(tm_test);
	var moment = room_speed*seconds;
	for(var i = 0; i < global.ENEM_POP[global.WAVE]*moment; i+= moment){
		timeline_moment_add_script(tm_test,i,scr_determineSpawnArea);	
	}
	
	//Create Timeline for HealthPacks
	/*if(timeline_exists(tm_healthpack)) timeline_clear(tm_healthpack);
	var moment = room_speed*healthPackTime;
	for(var i = 0; i < MAX_NUMBER_OF_HEALTHPACKS*moment; i+= moment){
		timeline_moment_add_script(tm_healthpack,i,scr_createHealthPacks);	
	}*/
	
	//Set global.FUN_TICK
	
	global.FUN_TICK = FUN_TICK_RATE * (1 + (global.WAVE / 12.5));
	
	if(!timeline_running){
		timeline_running = true;
	}
	scr_change_music(Music.SWARM);
	global.WAVE_PHASE++;
	


}
