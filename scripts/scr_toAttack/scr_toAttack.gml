///This script determines the next wave	
function scr_toAttack() {
	global.enemyCount = global.ENEM_POP[global.WAVE];
	global.BUILDER_EN = false;
	global.currentEnemyKills = 0;
	
	
	seconds = round_to_digit(3.6 - (global.WAVE/6.3), 2);
	if(seconds < 1) seconds = 1;
	
	healthPackTime = round_to_digit(4 + (global.WAVE/6), 1);

	//Create Timeline for Enemy Spawns
	if(timeline_exists(tm_test)) timeline_clear(tm_test);
	var moment = room_speed*seconds;
	for(var i = 0; i < global.ENEM_POP[global.WAVE]*moment; i+= moment){
		timeline_moment_add_script(tm_test,i,scr_determineSpawnArea);	
	}
	
	//Create Timeline for HealthPacks
	if(timeline_exists(tm_healthpack)) timeline_clear(tm_healthpack);
	var moment = room_speed*healthPackTime;
	for(var i = 0; i < MAX_NUMBER_OF_HEALTHPACKS*moment; i+= moment){
		timeline_moment_add_script(tm_healthpack,i,scr_createHealthPacks);	
	}
	
	//Set global.FUN_TICK
	
	global.FUN_TICK = FUN_TICK_RATE * (1 + (global.WAVE / 12.5));
	
	if(!timeline_running){
		timeline_running = true;
	}
	scr_change_music(Music.SWARM);
	global.WAVE_PHASE++;
	


}
