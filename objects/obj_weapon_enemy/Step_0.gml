/// @description Insert description here
// You can write your code in this editor
if(!global.BUILDER_EN){
	audio_emitter_position(wep_emit,x,y,0);
	audio_emitter_falloff(wep_emit,250,100,1);
	if(ammo > 0){
		if(timer <= 0){
			//FIRE PROJECTILE
				var angle = -spread;
				offset = (spread*2)/pelletCount;
				for(var i =0; i < pelletCount; i++) {
					var bullet = instance_create_layer(x,y,"instance_layer",pelletType);
					if(pelletType == obj_bullet_explosive_enem){					
						bullet.blastDamage = blastDamage;
						bullet.blastRadius = blastRadius;
						bullet.blastDmgTick = blastDmgTick;
						bullet.blastDuration = blastDuration;
					}else if(pelletType == obj_bullet_sine_enem){
						bullet.maxVelX = pelletVelocity*dcos(direction-angle+dev);
						bullet.maxVelY = -pelletVelocity*dsin(direction-angle+dev);						
						bullet.minVelX = pelletVelocity*dcos(direction-angle-dev);
						bullet.minVelY = -pelletVelocity*dsin(direction-angle-dev);	
					}
					bullet.def_velX = pelletVelocity*dcos(direction-angle);
					bullet.def_velY = -pelletVelocity*dsin(direction-angle);
					bullet.velX = bullet.def_velX;
					bullet.velY = bullet.def_velY;
					bullet.def_damage = damage;
					bullet.damage = bullet.def_damage;
					bullet.effect = effect;
					bullet.effectValue = effectValue;
					
					angle += offset;
				}
				ammo--;
			///
			timer = fireRate;
			if(audio_is_playing(mySound)){
				audio_stop_sound(mySound);
				audio_play_sound(mySound,10,false);
			}
		}
		if(timer >= 0) timer--;
	}else{
		if(reloadTimer > 0) {
			reloadTimer--;			
		}else{
			ammo = ammoK;
			reloadTimer = reloadRate;
		}
	}
}