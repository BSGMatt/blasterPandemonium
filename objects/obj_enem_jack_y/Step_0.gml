/// @description - MAIN
// You can write your code in this editor
if(myWeapon != noone){
	myWeapon.x = x - (sprite_width/2);
	myWeapon.y = y;
	if(instance_exists(obj_player)) myWeapon.direction = point_direction(myWeapon.x,myWeapon.y,obj_crystal.x,obj_crystal.y);
}

if(instance_exists(obj_crystal)){
	mspeedX = maxSpeed*dcos(direction);
	mspeedY = -maxSpeed*dsin(direction);
}

//when you see my face hope it gives you hell
if(distance_to_object(obj_crystal) <= spaceFromCrystal){
	mspeedX = 0;
	mspeedY = 0;
}

//COLLISION
//bullets
var inst = instance_place(x,y,obj_bullet_friendly);
if(inst != noone){
	hp -= inst.damage;
		if(inst.hasExplosive){
			var myExplosive = instance_create_depth(x,y,depth-100,obj_blast);
			myExplosive.damage = inst.blastDamage;
			myExplosive.radius = inst.blastRadius;
			myExplosive.duration = inst.blastDuration;
			myExplosive.dmgTick = inst.blastDmgTick;
		}
	audio_play_sound(sfx_hit,1,false);
	instance_destroy(inst);
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