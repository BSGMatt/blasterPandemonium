/// @description Insert description here
// You can write your code in this editor

if(tick >= dmgTick){
	damage = def_damage;
	tick = 0;
}else{
	damage = 0;
	tick++;
}
if(timer >= duration){
	audio_stop_sound(mySound);
	audio_emitter_free(blast_emit);
	scr_cam_reset();
	instance_destroy();	
}else{
	timer++;	
	scr_cam_shake_params(round(def_damage/10), 0.1);
}

