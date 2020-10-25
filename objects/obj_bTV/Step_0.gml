/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) <= radius){
		global.FUN += funRate;
		if(!audio_is_playing(sfx_tv)) audio_play_sound_on(bk_emit,sfx_tv,true,20);
	}
}
