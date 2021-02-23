// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_hud_content(){
	//This script will draw different text on the hud, based on certain conditions happening at the moment.
	var content = "Go Get 'Em!.";
	
	
	if(global.WAVE_PHASE == Phase.PREP){
		content = "Prepare your defenses! "+string_clock_format(global.TIMER/room_speed);
	}else if(global.WAVE_PHASE == Phase.BOSS){
		content = "Large Hostile Incoming!";
	}else{		
		if(global.FUN <= MAX_FUN/5){
			content = "Looks like your getting bored!";
		}
	
		if(global.plyHP <= global.plyMaxHP/3){
			content = "Your health is getting low!";	
		}
	
		if(global.CRYSTAL_HP <= MAX_CRYSTAL_HP/3){
			content = "DAIRY CRYSTAL BADLY DAMAGED!";	
		}
	}
	
	return content;
}