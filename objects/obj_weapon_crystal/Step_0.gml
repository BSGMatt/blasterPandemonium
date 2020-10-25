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
			audio_play_sound_on(wep_emit,sfx_blaster,false,10);
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
