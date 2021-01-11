/// @description Shoot
// You can write your code in this editor
damage = 20;
fireRate = 0.4*room_speed;
pelletCount = 1;
name = "PISTOL";
/// @description Insert description here
// You can write your code in this editor
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
							
							//SINE
							var sine = instance_create_layer(x,y,"instance_layer",obj_bullet_sine);
							sine.velX = pelletVelocity*dcos(direction-angle);
							sine.velY = -pelletVelocity*dsin(direction-angle);
							
							sine.maxVelX = pelletVelocity*dcos(direction-angle+dev);
							sine.maxVelY = -pelletVelocity*dsin(direction-angle+dev);
							
							sine.minVelX = pelletVelocity*dcos(direction-angle-dev);
							sine.minVelY = -pelletVelocity*dsin(direction-angle-dev);
							sine.damage = damage;
							sine.def_damage = damage;
							sine.maxDamage = maxDamage;
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
			if(mouse_check_button(mb_left)) audio_play_sound_on(wep_emit,sfx_cancel,false,30);
		}
	}
}else delay--;
