function scr_prepPhase() {
	if(room != rm_shop) global.TIMER--;
	if(global.TIMER <= 0){
		scr_toAttack();	
	}
	if((mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(ord("B")))
		&& global.INV_BLOCK[0] != -1){
		if(!global.BUILDER_EN) 	global.BUILDER_EN = true;
		else global.BUILDER_EN = false;
		audio_play_sound(sfx_confirm,2,false);
	}
	if(keyboard_check_pressed(vk_enter) && global.TIMER < (PREP_TIME-10)){
		scr_toAttack();
	}
	/*Added the "PREP_TIME - 10" part of the statement to prevent 
	the key pressed event and the (TIMER < 0) event to happen at the same frame.
	This was never a problem until July 31st; I don't know why GameMaker decided to change it's mind.*/
	if(keyboard_check_pressed(vk_space)){
		if(room == room_main){
			global.BUILDER_EN = false;
			room_goto(rm_shop) 
		}else{
			room_goto(room_main);
		}
	}


}
