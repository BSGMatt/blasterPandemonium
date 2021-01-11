/// @description Insert description here
// You can write your code in this editor
if(delay <= 0){
	if(!global.BUILDER_EN && !global.PLAYER_DIED && room == room_main){
		audio_emitter_position(wep_emit,-x,y,0);
		if(keyboard_check_pressed(ord("R"))){
			reloading = true;
			if(reloadTimer <= 0) reloadTimer = reloadRate;
			//Condition added here to prevent player from restarting reload timer
		}
		if(reloading){
			if(reloadTimer <=0){
				ammo = ammoK;
				reloading = false;
			}else{
				reloadTimer--;
			}
		}
		if(ammo > 0){
			if(mouse_check_button(mb_left)){
				if(timer <= 0 && !reloading){
					//FIRE PROJECTILE
						var angle = -spread;
						offset = (spread*2)/pelletCount;
						for(var i =0; i < pelletCount; i++){
							if(hasExplosive){
								var bullet = instance_create_layer(x,y,"instance_layer",obj_bullet_explosive);
								bullet.blastDamage = blastDamage;
								bullet.blastRadius = blastRadius;
								bullet.blastDmgTick = blastDmgTick;
								bullet.blastDuration = blastDuration;								
							}else{
								var bullet = instance_create_layer(x,y,"instance_layer",obj_bullet_friendly);
							}		
							bullet.def_velX = pelletVelocity*dcos(direction-angle);
							bullet.def_velY = -pelletVelocity*dsin(direction-angle);
							bullet.velX = bullet.def_velX;
							bullet.velY = bullet.def_velY;
							bullet.def_damage = damage;
							bullet.damage = damage;
							angle += offset;
						}
						ammo--;
					///
					timer = fireRate;
					audio_play_sound(sfx_blaster,10,false);
				}
			}
			if(timer >= 0) timer--;
		}else{
			if(mouse_check_button_pressed(mb_left)) {
				if(!audio_is_playing(sfx_cancel)) audio_play_sound(sfx_cancel,30,false);
			}
		}
	}
}else delay--;