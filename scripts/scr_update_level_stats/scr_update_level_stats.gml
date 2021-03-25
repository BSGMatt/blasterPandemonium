function scr_update_level_stats() {
	//DETERMINE PLAYER LEVEL AND TIER
	if(global.plyLevel < 10){
		global.PLAYER_TIER = 0;
	}else if(global.plyLevel >= 25){
		global.PLAYER_TIER = 4;	
	}else{
		global.PLAYER_TIER = floor(global.plyLevel / 5) - 1;
	}
	//
	if(global.plyLevel >= array_length(global.xpThreshold)){
		global.plyLevel = array_length(global.xpThreshold) - 1;
	}
	//STATS AT EACH LEVEL:
	if(instance_exists(obj_player)){
		switch(global.plyLevel){
			case 0:
				global.plyMaxHP = 200;
				obj_player.normalSpeed = 7;//max speed
				global.MAX_FUN = MAX_STARTING_FUN;
			break;
			
			case 1:
				global.plyMaxHP = 250;
				obj_player.normalSpeed += 0.5;
				obj_player.dashSpeed += 2;
				global.MAX_FUN += 3;
			break;

			case 2:
				obj_player.normalSpeed += 0.5;
				obj_player.dashSpeed += 2;
				global.MAX_FUN += 3;
			break;
	
			case 3:
				global.plyMaxHP = 300;
				obj_player.normalSpeed++;
				obj_player.dashSpeed += 2;
				global.MAX_FUN += 3;
			break;
				
			case 4:
				obj_player.normalSpeed++;
				obj_player.dashSpeed += 5;
				global.MAX_FUN += 3;
			break;
			
			default:
				global.plyMaxHP = round(300+log10(global.plyLevel)*global.plyLevel*2);//2xlog(x)+300
				global.MAX_FUN = round((4*power(global.plyLevel, 0.5) + 105) + log10(global.plyLevel));
				obj_player.normalSpeed = round_to_digit(8.5+log10(global.plyLevel)*ln(global.plyLevel)*1.25, 1);//1.5lg(x)+10
				obj_player.dashSpeed = round(25+log10(global.plyLevel)*ln(global.plyLevel)*2);//2lg(x)+28	
			break;
		}
			
			//MAX OUT SPEED
			if(obj_player.normalSpeed > MAX_PLAYER_SPEED) obj_player.normalSpeed = MAX_PLAYER_SPEED;
			
			
			global.plyHP = global.plyMaxHP;
			global.xp = 0;//clears XP
	}

	audio_play_sound(sfx_level_up,125,false);
}
