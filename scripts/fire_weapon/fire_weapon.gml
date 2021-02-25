// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fire_weapon(){
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
					bullet.effect = effect;
					bullet.effectValue = effectValue;
					
					
					angle += offset;
					
				}
				ammo--;
				///
				timer = fireRate;
				shakeTimer = fireRate/2;
				audio_stop_sound(mySound);
				audio_play_sound(mySound,10,false);
			if(timer >= 0){
				timer--;
				
			}
			if(shakeTimer >= 0){
				shakeTimer--;
				scr_cam_shake_params(0,shakeAngle);

			}else if(shakeTimer < 0){
				scr_cam_reset();	
				shaking = false;
			}
}