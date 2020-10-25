function scr_change_music(argument0) {
	//SCRIPT FOR CHANGING THE BACKGROUND MUSIC
	//arg0 song
	//song - music to change to

	if(audio_is_playing(global.BGM)){
		audio_destroy_stream(global.BGM);	
	}
	var loops = false;
	switch(argument0){
		case Music.MENU:
			global.BGM = audio_create_stream("Title Theme - Mono.ogg");
			loops = true;
		break;
	
		case Music.PREP:
			global.BGM = audio_create_stream("Preparation.ogg");
			loops = true;
		break;
	
		case Music.BOSS:
			global.BGM = audio_create_stream("Boss.ogg");
			loops = true;
		break;
	
		case Music.SWARM:
			global.BGM = audio_create_stream("Attack - Mono.ogg");
			loops = true;
		break;
	
		case Music.VICTORY:
			global.BGM = audio_create_stream("Victory - Mono.ogg");
		break;
	
		case Music.GAME_OVER:
			global.BGM = audio_create_stream("Game Over - Mono.ogg");
		break;
	
		default:
			global.BGM = audio_create_stream("Attack Them (Beta).ogg");
			loops = true;
		break;
	}

	audio_play_sound(global.BGM,100,loops);


}
