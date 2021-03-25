/// @description MAIN
// You can write your code in this editor
//RESET HEALTH
if(global.plyHP > global.plyMaxHP){
	global.plyHP = global.plyMaxHP;	
}



//AUDIO
audio_listener_position(x,y,0);

//POINT ARROW IN NEAREST ENEMY'S DIRECTION
if(global.WAVE_PHASE > Phase.PREP){
	if(global.WAVE_PHASE = Phase.SWARM) {
		radarTarget = instance_nearest(x,y,obj_enemB);
	}else{
		radarTarget = instance_nearest(x,y,obj_boss);
	}	
	if(instance_exists(radarTarget)) radarDir = point_direction(x,y,radarTarget.x,radarTarget.y);
}

//I-Frames
if(invincible){
	image_alpha = 0.5;
	iFrames++;
	if(iFrames >= maxIFrames){
		invincible = false;
		iFrames = 0;		
	}
}else{
	image_alpha = 1;	
}


///INPUTS 
moveX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
moveY = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//interpolate speed
if(moveX != 0 || moveY != 0) interpolate_speed();	

//apply fun modifiers
funMultiplier = (global.FUN / MAX_STARTING_FUN) + 0.1;

maxSpeed = mSpeed * funMultiplier;

mspeedX = maxSpeed*moveX;
mspeedY = maxSpeed*moveY;

//DASH
if(keyboard_check_pressed(vk_shift)){
	dashing = true;
	alarm[0] = room_speed*0.25;
	mspeedX = moveX*dashSpeed;
	mspeedY = moveY*dashSpeed;
}

var block = instance_place(x,y,obj_block);
if(block != noone){
	mspeedX = block.spdMod*maxSpeed*moveX;	
	mspeedY = block.spdMod*maxSpeed*moveY;	
}

///COLLISION
//Solid block
if(place_meeting(x+mspeedX,y,obj_bGround)){
	while(!place_meeting(x+sign(mspeedX),y,obj_bGround)) x+= sign(mspeedX);
	mspeedX = 0;
}
if(place_meeting(x,y+mspeedY,obj_bGround)){
	while(!place_meeting(x,y+sign(mspeedY),obj_bGround)) y+= sign(mspeedY);
	mspeedY = 0;
}

//Solid block part 2 electric boogaloo
if(place_meeting(x+mspeedX,y,obj_bPerm)){
	while(!place_meeting(x+sign(mspeedX),y,obj_bPerm)) x+= sign(mspeedX);
	mspeedX = 0;
}
if(place_meeting(x,y+mspeedY,obj_bPerm)){
	while(!place_meeting(x,y+sign(mspeedY),obj_bPerm)) y+= sign(mspeedY);
	mspeedY = 0;
}

//Solid block part 3 electric beegalee
if(place_meeting(x+mspeedX,y,obj_bGroundSuper)){
	while(!place_meeting(x+sign(mspeedX),y,obj_bGroundSuper)) x+= sign(mspeedX);
	mspeedX = 0;
}
if(place_meeting(x,y+mspeedY,obj_bGroundSuper)){
	while(!place_meeting(x,y+sign(mspeedY),obj_bGroundSuper)) y+= sign(mspeedY);
	mspeedY = 0;
}

x += mspeedX;
y += mspeedY;

//reset interpolation
if(interpolationActive && interpolationTimer <= 0){
	mspeed = normalSpeed;
	interpolationActive = false;
}

///ITEMS
//Healthpack
var pack = instance_place(x,y,obj_healthpack);
if(pack != noone){
	global.plyHP += global.packHealing;
	global.FUN += 0.5;
	instance_destroy(pack);
}
//Bullets
var inst = instance_place(x,y,obj_bullet_enemy);
if(inst != noone){
	if(!invincible){
		global.plyHP -= inst.damage*(1/funMultiplier);
		if(inst.hasExplosive){
			var myExplosive = instance_create_depth(x,y,depth-100,obj_blast);
			myExplosive.damage = inst.blastDamage;
			myExplosive.radius = inst.blastRadius;
			myExplosive.duration = inst.blastDuration;
			myExplosive.dmgTick = inst.blastDmgTick;
		}
		audio_play_sound(sfx_hit,1,false);
		invincible = true;
		instance_destroy(inst);
	}
}

//Explosions
var boom = instance_place(x,y,obj_blast_enemy);
if(boom != noone){
	global.plyHP -= boom.damage;	
	if(!audio_is_playing(sfx_hit_blast)) audio_play_sound(sfx_hit_blast,1,false);
}
//Coins
var inst = instance_place(x,y,obj_coin);
if(inst != noone){
	global.CURRENCY += inst.value;
	global.FUN += inst.value/5;
	audio_play_sound(sfx_confirm,1,false);
	instance_destroy(inst);
}
//WEAPONS
//Sroll through inventory slot
if(array_length(global.INV_WEAPON) > 1){
	if(keyboard_check_pressed(ord("Q"))){
		//SAVE AMMO
		if(instance_exists(myWeapon)){
			ammo[myWeapon.type] = myWeapon.ammo;
		}
		//
		if(slotPos > 0) slotPos--;
		switched = true;
	}else if(keyboard_check_pressed(ord("E"))){
		//SAVE AMMO
		if(instance_exists(myWeapon)){
			ammo[myWeapon.type] = myWeapon.ammo;
		}
		//
		if(slotPos < array_length(global.INV_WEAPON)-1) slotPos++;
		switched = true;
	}else{
		switched = false;	
	}
}

//SWAPPING ITEMS
if(switched){
	instance_destroy(myWeapon);
	objID = noone;
	switch(global.INV_WEAPON[slotPos]){
		case weaponID.std_pistol:
			objID = obj_weapon_pistol;
		break;
		
		case weaponID.std_shotgun:			
			objID = obj_weapon_shotgun;
		break;
		
		case weaponID.std_sniper:
			objID = obj_weapon_sniper;
		break;
		
		case weaponID.std_ak:
			objID = obj_weapon_ak;
		break;
		
		case weaponID.std_sine:
			objID = obj_weapon_sine;
		break;
		
		case weaponID.std_grenade_launcher:
			objID = obj_weapon_grenadeLauncher;
		break;
		
		case weaponID.super_shotgun:
			objID = obj_weapon_supershotgun;
		break;
		
		case weaponID.super_pistol:
			objID = obj_weapon_superpistol;
		break;
		
		case weaponID.super_ak:
			objID = obj_weapon_superak;
		break;
		
		case weaponID.quirky_ak:
			objID = obj_weapon_quirky;
		break;
		
		case weaponID.sine_shotgun:
			objID = obj_weapon_sine_shotgun;
		break;
		
		case weaponID.std_cannon:
			objID = obj_weapon_cannon;
		break;
		
	}
	if(objID != noone) myWeapon = instance_create_depth(x,y,depth-100,objID);
	if(myWeapon != noone){
		myWeapon.ammo = ammo[myWeapon.type];
		switched = false;
	}
}

//set position of myWeapon
facingDirection = point_direction(x,y,mouse_x,mouse_y);
var offset = 22.5;
if(facingDirection >= (90 - offset) && facingDirection <= (90 + offset)){
	image_index = 1;
	image_xscale = 1;
}else if(facingDirection >= (45 - offset) && facingDirection <= (45 + offset)){
	image_index = 4;
	image_xscale = -1;
}else if(facingDirection >= (360 - offset) && facingDirection <= (0 + offset)){
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
	image_index = 3;
	image_xscale = -1;
}




if(instance_exists(myWeapon)){
	myWeapon.x = x - (sprite_width/2);
	myWeapon.y = y;	
	//AUTO_LOCK
	if((mouse_check_button(mb_right) || keyboard_check(ord("C")))){
		myWeapon.direction = radarDir;	
	}else{
		myWeapon.direction = facingDirection;	
	}
}

//prevent player from being seen 
if(room != room_main) instance_deactivate_object(obj_player);



