/// @description - MAIN
randomize();
audio_emitter_position(au_emit,x,y,0);
if(x > room_width){
	while(bbox_right > room_width) x-= sprite_get_width(object_get_sprite(object_index));
}
if(y > room_height){
	while(bbox_bottom > room_height) y-= sprite_get_height(object_get_sprite(object_index));
}
if(x < 0){
	while(bbox_left < 0) x+= sprite_get_width(object_get_sprite(object_index));
}
if(y < 0){
	while(bbox_bottom > room_height) y+= sprite_get_height(object_get_sprite(object_index));
}




//Direction
if(instance_exists(obj_player)) facingDirection = point_direction(x,y,obj_player.x,obj_player.y);
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
if(myWeapon != noone){
	myWeapon.x = x - (sprite_width/2);
	myWeapon.y = y;
	if(instance_exists(obj_player)) myWeapon.direction = facingDirection;
}

//COLLISION
//bullets
var inst = instance_place(x,y,obj_bullet_friendly);
if(inst != noone){
	hp -= inst.damage;
		if(inst.hasExplosive){
			var myExplosive = instance_create_depth(x,y,depth-100,obj_blast_friendly);
			myExplosive.damage = inst.blastDamage;
			myExplosive.radius = inst.blastRadius;
			myExplosive.duration = inst.blastDuration;
			myExplosive.dmgTick = inst.blastDmgTick;
		}
	instance_destroy(inst);
	audio_play_sound(sfx_hit,1,false);
}

//explosions
var boom = instance_place(x,y,obj_blast_friendly);
if(boom != noone){
	hp -= boom.damage;	
	audio_play_sound(sfx_hit,1,false);
}



//This code right determines the direction the enemy will go, basically replace the key inputs the player has. 
//MOVEMENT
//"TOLERANCE" is how far the enemy will be from a block
mspeedX = maxSpeed;
mspeedY = 0;
if(place_meeting(x+TOLERANCE,y,obj_block)){
	mspeedX = 0;
	mspeedY = maxSpeed;
}
if(place_meeting(x,y+TOLERANCE,obj_block)){
	mspeedX = -maxSpeed;
	mspeedY = 0;
}
if(place_meeting(x-TOLERANCE,y,obj_block)){
	mspeedX = 0;
	mspeedY = -maxSpeed;
}
if(place_meeting(x,y-TOLERANCE,obj_block)){
	mspeedX = maxSpeed;
	mspeedY = 0;	
}

/*if(place_meeting(x,y,obj_field)){
	path_end();
	onPath = false;
	if(instance_exists(obj_player)){
		moveX = sign(obj_player.x - x);
		moveY = sign(obj_player.y - y);
	}else{
		moveX = sign(obj_crystal.x - x);
		moveY = sign(obj_crystal.y - y);
	}
}else{
	onPath = true;
	if(path_index = -1) path_start(myPath,maxSpeed,path_action_continue,false);
}*/

//mspeedX = moveX*maxSpeed;
//mspeedY = moveY*maxSpeed;

///COLLISION
//Horizontal
if(place_meeting(x+mspeedX,y,obj_bGround)){
	if(onPath){
		path_speed *= -1;	
	}else{
		while(!place_meeting(x+sign(mspeedX),y,obj_bGround)) x+= sign(mspeedX);
		mspeedX = 0;
	}
}
if(place_meeting(x,y+mspeedY,obj_bGround)){
	if(onPath){
		path_speed *= -1;	
	}else{
		while(!place_meeting(x,y+sign(mspeedY),obj_bGround)) y+= sign(mspeedY);
		mspeedY = 0;
	}
	
}

if(place_meeting(x+mspeedX,y,obj_bPerm)){
	if(onPath){
		path_speed *= -1;	
	}else{
		while(!place_meeting(x+sign(mspeedX),y,obj_bPerm)) x+= sign(mspeedX);
		mspeedX = 0;
	}
}
if(place_meeting(x,y+mspeedY,obj_bPerm)){
	if(onPath){
		path_speed *= -1;	
	}else{
		while(!place_meeting(x,y+sign(mspeedY),obj_bPerm)) y+= sign(mspeedY);
		mspeedY = 0;
	}

}

if(!place_free(x,y)){
	while(!place_free(x,y)){
		x+=4;
		y+=4;
	}
}
if(place_meeting(x,y,obj_bWater)){
	mspeedX = sign(mspeedX)*maxSpeed/2;
	mspeedY = sign(mspeedY)*maxSpeed/2;
}

x += mspeedX;
y += mspeedY;

if(hp <= 0) {
	global.xp+=killP;
	global.currentEnemyKills++;
	var inst = instance_create_depth(x,y,depth-100,obj_coin_reg);
	inst.value = irandom_range(minCoinVal,maxCoinVal);
	global.FUN += ((-.25*power(global.currentEnemyKills,2))+(4*global.currentEnemyKills)+4)/100;
	audio_play_sound_on(au_emit,sfx_die,false,20);
	audio_emitter_free(au_emit);
	instance_destroy();
	instance_destroy(myWeapon);
}