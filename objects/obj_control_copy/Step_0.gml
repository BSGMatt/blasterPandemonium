/// @description run scripts
// You can write your code in this editor
/*if(global.LOAD_GAME_FROM_MENU && !global.GAME_LOADED){
	scr_load_game();	
	global.WAVE_STARTED = false;
	global.GAME_LOADED = true;
}*/


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
		}else{
			camera_set_view_target(view_camera[0],obj_player);
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