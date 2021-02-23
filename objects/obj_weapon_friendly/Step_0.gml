/// @description Insert description here
// You can write your code in this editor
if(delay <= 0){
	if(!global.BUILDER_EN && !global.PLAYER_DIED && room == room_main){
		audio_emitter_position(wep_emit,-x,y,0);
		if(keyboard_check_pressed(ord("R"))){
			audio_play_sound(sfx_reload_begin,30,false);
			reloading = true;
			if(reloadTimer <= 0) reloadTimer = reloadRate;
			if(!audio_is_playing(sfx_reload_loop)) audio_play_sound(sfx_reload_loop,30,true);
			//Condition added here to prevent player from restarting reload timer sound effect
		}
		if(reloading){
			if(reloadTimer <= 0){
				ammo = ammoK;
				reloading = false;
				if(audio_is_playing(sfx_reload_loop)) audio_stop_sound(sfx_reload_loop);
				 audio_play_sound(sfx_reload_end,30,false);
			}else{
				reloadTimer--;
			}			
		}
		if(ammo > 0 && mouse_check_button(mb_left)){
			if(timer <= 0 && !reloading){
				//FIRE PROJECTILE
				var angle = -spread;
				offset = (spread*2)/pelletCount;
				for(var i =0; i < pelletCount; i++){
					var bullet = instance_create_layer(x,y,"instance_layer",pelletType);
					if(pelletType == obj_bullet_explosive){					
						bullet.blastDamage = blastDamage;
						bullet.blastRadius = blastRadius;
						bullet.blastDmgTick = blastDmgTick;
						bullet.blastDuration = blastDuration;								
					}else if(pelletType == obj_bullet_sine_friendly){
						bullet.maxVelX = pelletVelocity*dcos(direction-angle+dev);
						bullet.maxVelY = -pelletVelocity*dsin(direction-angle+dev);						
						bullet.minVelX = pelletVelocity*dcos(direction-angle-dev);
						bullet.minVelY = -pelletVelocity*dsin(direction-angle-dev);	
					}
					bullet.def_velX = pelletVelocity*dcos(direction-angle);
					bullet.def_velY = -pelletVelocity*dsin(direction-angle);
					bullet.velX = bullet.def_velX;
					bullet.velY = bullet.def_velY;
					bullet.def_damage = damage * obj_player.funMultiplier;
					bullet.damage = bullet.def_damage;
					
					
					angle += offset;
				}
				ammo--;
				///
				timer = fireRate;
				if(!shaking){
					shaking = true;
					shakeTimer = fireRate/2;

				}
				audio_play_sound(mySound,10,false);
			}
			if(timer >= 0){
				timer--;
				
			}
			if(shaking){
				shakeTimer--;
				scr_cam_shake_params(0,shakeAngle);
				if(shakeTimer < 0){
					scr_cam_reset();	
					shaking = false;
				}
			}

		}else{
			scr_cam_reset();
			if(mouse_check_button_pressed(mb_left)) {
				if(!audio_is_playing(sfx_cancel)) audio_play_sound(sfx_cancel,30,false);
			}
		}
	}
}else delay--;