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
	if(timeline_exists(tm_test)) timeline_clear(tm_test);
	var moment = room_speed*seconds;
	for(var i = 0; i < global.ENEM_POP[global.WAVE]*moment; i+= moment){
		timeline_moment_add_script(tm_test,i,scr_determineSpawnArea);	
	}
	if(!timeline_running){
		timeline_running = true;
	}
	scr_change_music(Music.SWARM);
	global.WAVE_PHASE++;
	


}
