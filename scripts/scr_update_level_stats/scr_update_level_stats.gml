function scr_update_level_stats() {
	//DETERMINE PLAYER LEVEL AND TIER
	if(global.plyLevel < 20){
		if(global.plyLevel < 15){
			if(global.plyLevel < 10){
				if(global.plyLevel < 5){
					global.PLAYER_TIER = 0;
				}else{
					global.PLAYER_TIER = 1;		
				}
			}else{
				global.PLAYER_TIER = 2;		
			}
		}else{
			global.PLAYER_TIER = 3;	
		}
	}else{
		global.PLAYER_TIER = 4;	
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
					obj_player.normalSpeed = 8;//max speed
					obj_player.dashSpeed = 16;//speed when dashing
					break;
			
				case 1:
					global.plyMaxHP = 250;
					obj_player.normalSpeed = 8.5;
					obj_player.dashSpeed = 16;
					break;

				case 2:
					obj_player.normalSpeed = 9;
					obj_player.dashSpeed = 18;
					break;
	
				case 3:
					global.plyMaxHP = 300;
					obj_player.normalSpeed = 9;
					obj_player.dashSpeed = 20;
					break;
				
				case 4:
					obj_player.normalSpeed = 10;
					obj_player.dashSpeed = 25;
					break;
			
				default:
					global.plyMaxHP = round(300+log10(global.plyLevel)*global.plyLevel*2);//2xlog(x)+300
					obj_player.normalSpeed = round(10+log10(global.plyLevel)*ln(global.plyLevel)*1.5);//3lg(x)+14
					obj_player.dashSpeed = round(25+log10(global.plyLevel)*ln(global.plyLevel)*2);//2lg(x)+28	
					break;
				}
				global.plyHP = global.plyMaxHP;
		}

	audio_play_sound(sfx_level_up,125,false);
}
