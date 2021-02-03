/// @description - MAIN
// You can write your code in this editor
//finding target
minDist = 10000;
for(var i=0; i < instance_number(obj_block); i++){
		var inst = instance_find(obj_block,i);	
		if(inst.fromBuilder = true && distance_to_object(inst) <= minDist) {//dont want it to target map geometery
			minDist = distance_to_object(inst);
			target = inst;
			targetAvail = true;	
		}
}
if(!instance_exists(target)){
	target = obj_crystal;	
}

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
	image_index = 3;
	image_xscale = -1;
}
if(myWeapon != noone){
	myWeapon.x = x - (sprite_width/2);
	myWeapon.y = y;
	if(instance_exists(myWeapon)) myWeapon.direction = facingDirection;
}

if(instance_exists(target)){
	mspeedX = maxSpeed*dcos(facingDirection);
	mspeedY = -maxSpeed*dsin(facingDirection);
}

//when you see my face hope it gives you hell
if(distance_to_object(target) <= spaceFromBlock && target != obj_crystal){
	mspeedX = 0;
	mspeedY = 0;
}

//COLLISION
//bullets
var inst = instance_place(x,y,obj_bullet_friendly);
if(inst != noone){
	hp -= inst.damage;
	audio_play_sound(sfx_hit,1,false);
		if(inst.hasExplosive){
			var myExplosive = instance_create_depth(x,y,depth-100,obj_blast);
			myExplosive.damage = inst.blastDamage;
			myExplosive.radius = inst.blastRadius;
			myExplosive.duration = inst.blastDuration;
			myExplosive.dmgTick = inst.blastDmgTick;
		}
	instance_destroy(inst);
	instance_create_depth(x,y,depth-100,obj_poof_strong);
}

//explosions
var boom = instance_place(x,y,obj_blast_friendly);
if(boom != noone){
	hp -= boom.damage;	
	if(!audio_is_playing(sfx_hit_blast)) audio_play_sound(sfx_hit_blast,1,false);
}

///COLLISION
//Horizontal
if(place_meeting(x+mspeedX,y,obj_bGround)){
		while(!place_meeting(x+sign(mspeedX),y,obj_bGround)) x+= sign(mspeedX);
		mspeedX = 0;
}
if(place_meeting(x,y+mspeedY,obj_bGround)){
		while(!place_meeting(x,y+sign(mspeedY),obj_bGround)) y+= sign(mspeedY);
		mspeedY = 0;
}

//Horizontal
if(place_meeting(x+mspeedX,y,obj_bPerm)){
		while(!place_meeting(x+sign(mspeedX),y,obj_bPerm)) x+= sign(mspeedX);
		mspeedX = 0;
}
if(place_meeting(x,y+mspeedY,obj_bPerm)){
		while(!place_meeting(x,y+sign(mspeedY),obj_bPerm)) y+= sign(mspeedY);
		mspeedY = 0;
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
	instance_destroy();
	instance_destroy(myWeapon);
}