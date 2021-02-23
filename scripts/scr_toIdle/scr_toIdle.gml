function scr_toIdle() {
	if(!instance_exists(obj_player)) instance_activate_object(obj_player);

	global.BOSS_SPAWNED = false;
	global.BOSS_EXISTS = false;
	timeline_position = 0;
	timeline_running = false;

	global.plyHP = global.plyMaxHP;
	global.FUN += STARTING_FUN;
	if(global.FUN > global.MAX_FUN) global.FUN = global.MAX_FUN;

	global.CRYSTAL_HP = MAX_CRYSTAL_HP;
	if(instance_exists(obj_crystal)) {
		obj_crystal.myColor = c_white;
		obj_crystal.dead = false;	
	}

	global.WAVE++;
	global.WAVE_PHASE = Phase.IDLE;		
	global.WAVE_STARTED = false;
	scr_change_music(Music.VICTORY);

	scr_save_game();

	if(global.WAVE >= 30){
		scr_end_game();
	}


}
