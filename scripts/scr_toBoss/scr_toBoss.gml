function scr_toBoss() {
	scr_change_music(Music.BOSS);
	rand = irandom_range(0,3);
	spawnX = 0;
	spawnY = 0;
	switch(rand){
		case 0:
			spawnX = room_width/4;
			spawnY = room_height/4;
		break;
		case 1:
			spawnX = room_width*(3/4);
			spawnY = room_height*(3/4);
		break;
		case 2:
			spawnX = room_width/4;
			spawnY = room_height*(3/4);
		break;
		default:
			spawnX = room_width*(3/4);
			spawnY = room_height/4;
		break;
	}	

	if(!global.BOSS_SPAWNED){
		switch(global.WAVE){
			default:
			instance_create_layer(spawnX,spawnY,"instance_layer",obj_boss_shiggy);
			break;
		}
		global.BOSS_SPAWNED = true;
		global.BOSS_EXISTS = true;
	}
	global.WAVE_PHASE++;


}
