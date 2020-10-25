function scr_bossPhase() {
	if(global.plyHP <= 0){
		global.PLAYER_DIED = true;
	}

	if(instance_number(obj_boss) < 1 || keyboard_check_pressed(vk_enter)){
		scr_toIdle();
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
				obj_player.x = room_width/2;
				obj_player.y = room_height/2;
				global.PLAYER_DIED = false;
				respawnTimer = playerRespawnTime;
			}		
		}
	}



}
