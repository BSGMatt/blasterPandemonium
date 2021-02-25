// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_movement(){
	//This code right determines the direction the enemy will go, basically replace the key inputs the player has. 
	//MOVEMENT
	if(place_meeting(x,y,obj_field)){
		wandering = false;
		if(instance_exists(obj_player)){
			moveX = sign(obj_player.x - x);
			moveY = sign(obj_player.y - y);
		}else{
			moveX = sign(obj_crystal.x - x);
			moveY = sign(obj_crystal.y - y);
		}
	}else{
		wandering = true;
	}


	//"TOLERANCE" is how far the enemy will be from a block
	if(wandering){
		mspeedX = maxSpeed*effectVal;
		mspeedY = 0;
		if(place_meeting(x+TOLERANCE,y,obj_block)){
			mspeedX = 0;
			mspeedY = maxSpeed*effectVal;
		}
		if(place_meeting(x,y+TOLERANCE,obj_block)){
			mspeedX = -maxSpeed*effectVal;
			mspeedY = 0;
		}
		if(place_meeting(x-TOLERANCE,y,obj_block)){
			mspeedX = 0;
			mspeedY = -maxSpeed*effectVal;
		}
		if(place_meeting(x,y-TOLERANCE,obj_block)){
			mspeedX = maxSpeed*effectVal;
			mspeedY = 0;	
		}
	}else{
		mspeedX = moveX*maxSpeed*effectVal;
		mspeedY = moveY*maxSpeed*effectVal;
	}
}

function enemy_update_direction(target){
	//Direction
	if(instance_exists(target)) facingDirection = point_direction(x,y,target.x,target.y);
	var offset = 22.5;
	if(facingDirection >= (90 - offset) && facingDirection <= (90 + offset)){
		image_index = 1;
		image_xscale = 1;
	}else if(facingDirection >= (45 - offset) && facingDirection <= (45 + offset)){
		image_index = 4;
		image_xscale = -1;
	}else if(facingDirection <= (offset) ||	facingDirection >= (360 - offset)){
		image_index = 3;
		image_xscale = -1;
	}else if(facingDirection >= (135 - offset) && facingDirection <= (135 + offset)){
		image_index = 4;
		image_xscale = 1;
	}else if(facingDirection >= (180 - offset) && facingDirection <= (180 + offset)){
		image_index = 3;
		image_xscale = 1;
	}else if(facingDirection >= (225 - offset) && facingDirection <= (225 + offset)){
		image_index = 5;
		image_xscale = 1;
	}else if(facingDirection >= (270 - offset) && facingDirection <= (270 + offset)){
		image_index = 2;
		image_xscale = 1;
	}else if(facingDirection >= (315 - offset) && facingDirection <= (315 + offset)){
		image_index = 5;
		image_xscale = -1;
	}else{
		image_index = 0;
		image_xscale = 1;
	}
	
	//AIM WEAPON
	if(instance_exists(myWeapon)){
		myWeapon.x = x - (sprite_width/2);
		myWeapon.y = y;
		myWeapon.direction = facingDirection;
	}
}

function enemy_collide_with_projectiles(){
	//bullets
	var inst = instance_place(x,y,obj_bullet_friendly);
	if(inst != noone){
		hp -= inst.damage;
		effect = inst.effect;
		effectVal = inst.effectValue;
		effectChanged = true;
			if(inst.hasExplosive){
				var myExplosive = instance_create_depth(x,y,depth-100,obj_blast_friendly);
				myExplosive.damage = inst.blastDamage;
				myExplosive.radius = inst.blastRadius;
				myExplosive.duration = inst.blastDuration;
				myExplosive.dmgTick = inst.blastDmgTick;
				myExplosive.shakeAngle = inst.blastShakeAngle;
				myExplosive.shakeShift = inst.blastShakeShift;
			}
		instance_create_depth(inst.x,inst.y,depth-100,obj_poof_strong);
		instance_destroy(inst);
		audio_play_sound(sfx_hit,1,false);
	}
	
	//explosions
	var boom = instance_place(x,y,obj_blast_friendly);
	if(boom != noone){
		hp -= boom.damage;	
		if(!audio_is_playing(sfx_hit_blast)) audio_play_sound(sfx_hit_blast,1,false);
	}
}

function enemy_collide_with_terrain(){
	if(place_meeting(x+mspeedX,y,obj_bGround)){
		while(!place_meeting(x+sign(mspeedX),y,obj_bGround)) x+= sign(mspeedX);
		mspeedX = 0;
	}
	if(place_meeting(x,y+mspeedY,obj_bGround)){
		while(!place_meeting(x,y+sign(mspeedY),obj_bGround)) y+= sign(mspeedY);
		mspeedY = 0;
	}

	if(place_meeting(x+mspeedX,y,obj_bPerm)){
		while(!place_meeting(x+sign(mspeedX),y,obj_bPerm)) x+= sign(mspeedX);
		mspeedX = 0;
	}
	if(place_meeting(x, y+mspeedY, obj_bPerm)){
		while(!place_meeting(x, y+sign(mspeedY), obj_bPerm)) y+= sign(mspeedY);
		mspeedY = 0;	
	}
}

function enemy_push(){
	if(!place_free(x, y)){
		while(!place_free(x, y)){
			x+=4;
			y+=4;
		}
	}

	x += mspeedX;
	y += mspeedY;
}

function enemy_control_effects(){
	//CONTROL STATUS EFFECTS
	if(effectChanged){
		switch(effect){
			case CharacterEffect.SLOWED:
				effectTimer = 2 * room_speed;
				effectVal = 0.5;
			break;
	
			default:
				effectTimer = -1;
			break;
		}
		effectChanged = false;
	}

	if(effectTimer >= 0){
		effectTimer--;	
	}else{
		effectVal = 1;
		effect = CharacterEffect.NORMAL;
	}
}

function enemy_die(){
	global.xp+=killP;
	global.currentEnemyKills++;
	var inst = instance_create_depth(x, y, depth-100, obj_coin_reg);
	inst.value = irandom_range(minCoinVal, maxCoinVal);
	global.FUN += ((-.25 * power(global.currentEnemyKills, 2)) + (4*global.currentEnemyKills) + 4) / 100;
	audio_play_sound_on(au_emit, sfx_die,false,20);
	audio_emitter_free(au_emit);
	instance_destroy();
	instance_destroy(myWeapon);
}

function check_for_bounds(){
	if(x > room_width){
	while(bbox_right > room_width) x-= sprite_get_width(object_get_sprite(object_index));
	}else if(y > room_height){
	while(bbox_bottom > room_height) y-= sprite_get_height(object_get_sprite(object_index));
	}
	if(x < 0){
	while(bbox_left < 0) x+= sprite_get_width(object_get_sprite(object_index));
	}else if(y < 0){
	while(bbox_bottom > room_height) y+= sprite_get_height(object_get_sprite(object_index));
	}	
}