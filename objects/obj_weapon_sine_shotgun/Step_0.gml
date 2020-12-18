/// @description Insert description here
// You can write your code in this editor
spread = irandom_range(10,20);

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
							var bullet = instance_create_layer(x,y,"instance_layer",obj_bullet_sine);
							bullet.velX = pelletVelocity*dcos(direction-angle);
							bullet.velY = -pelletVelocity*dsin(direction-angle);
							
							bullet.maxVelX = pelletVelocity*dcos(direction-angle+dev);
							bullet.maxVelY = -pelletVelocity*dsin(direction-angle+dev);
							
							bullet.minVelX = pelletVelocity*dcos(direction-angle-dev);
							bullet.minVelY = -pelletVelocity*dsin(direction-angle-dev);
							bullet.damage = damage;
							bullet.def_damage = damage;
							bullet.maxDamage = maxDamage;
							angle += offset;
						}
						ammo--;
					///
					timer = fireRate;
					audio_play_sound(sfx_blaster,10,false);
				}
			}
			if(timer >= 0) timer--;
		}
	}
}else delay--;