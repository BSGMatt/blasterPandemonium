/// @description run scripts
// You can write your code in this editor

if(gamePause == false){
	if(room == room_main || room == rm_shop){
		if(global.CRYSTAL_HP <= 0 && global.PLAYER_DIED){
			scr_game_over();
		}
		//SETUP BASIC PHASE BEHAVIOR
		if(!global.WAVE_STARTED){
			global.WAVE_PHASE = Phase.IDLE;
			if(!instance_exists(obj_player)) instance_create_layer(global.PLAYER_SPAWN_X,global.PLAYER_SPAWN_Y,"instance_layer",obj_player);	
			if(!instance_exists(obj_crystal)) instance_create_layer(global.CRYSTAL_SPAWN_X,global.CRYSTAL_SPAWN_Y,"instance_layer",obj_crystal);
		}
		//VIEW FAILSAFE
		if(!instance_exists(obj_player)){
			camera_set_view_target(view_camera[0],obj_crystal);
			camTarget = obj_crystal;
		}else{
			camera_set_view_target(view_camera[0],obj_player);
			camTarget = obj_player;
		}
		
		//SHAKE VIEW (TEST)
		if(!shakeOk && keyboard_check_pressed(vk_numpad5)){
			shakeTimer = room_speed/2;	
			shakeOk = true;
			
		}
		
		if(shakeOk){
			shakeTimer--;
			scr_cam_shake();
			
			if(shakeTimer < 0) {
				scr_cam_reset();
				shakeOk = false;
			}
		}
		
		
		switch(global.WAVE_PHASE){
			case Phase.IDLE:
				if(keyboard_check_pressed(vk_enter)){
					global.TIMER = PREP_TIME;
					global.WAVE_PHASE = Phase.PREP;
					global.WAVE_STARTED = true;
					scr_change_music(Music.PREP);
				}
			break;
		
			case Phase.PREP:
				//PREP PHASE STUFF 
				scr_prepPhase();
				//
			break;
			case Phase.SWARM:
				//SWARM PHASE STUFF
				scr_attackPhase();
				//
			break;
			case Phase.BOSS:
				//BOSS PHASE STUFF
				scr_bossPhase();
				//
			break;
		}
	}
}else{
	if(keyboard_check_pressed(vk_tab)) scr_quit_to_menu();	
}