/// @description Insert description here
// You can write your code in this editor
if(global.CRYSTAL_HP <= 0){
	dead = true;
	instance_destroy(myWeapon);
	myColor = c_black;
}

if(global.CRYSTAL_HP > MAX_CRYSTAL_HP){
	global.CRYSTAL_HP = MAX_CRYSTAL_HP;
}

if(!dead && healing){
	if(healTimer > healTime){
		global.CRYSTAL_HP += CRYSTAL_HPS;
		healTimer = 0;
	}else{
		healTimer++;	
	}
}

//start passive healing
if(gotHit){
	//reset healing timer
	image_alpha = 0.5;
	iFrames = 0;
	healing = false;
	gotHit = false;
}else{
	iFrames++;
	image_alpha = 1;
	if(iFrames >= maxIFrames){
		healing = true;	
	}
}

//FIND CLOSEST TARGET
if(global.WAVE_PHASE == Phase.SWARM){
	minDist = 10000;
	for(var i=0; i < instance_number(obj_enemB); i++){
		var inst = instance_find(obj_enemB,i);	
		if(distance_to_object(inst) <= radius) {
			enemyInField[i] = inst;
			targetAvail = true;	
		}
	}
	for(var i=0; i < array_length_1d(enemyInField); i++){
		var dist = distance_to_object(enemyInField[i]);
		if(dist < minDist){
			minDist = dist;
			target = enemyInField[i];
		}
	}
}else if(global.WAVE_PHASE = Phase.BOSS){
	if(instance_exists(obj_boss)) target = obj_boss;
}	

var bullet = instance_place(x,y,obj_bullet_enemy);
if(bullet != noone){
		global.CRYSTAL_HP -= bullet.damage;
		if(bullet.hasExplosive){
			var myExplosive = instance_create_depth(x,y,depth-100,obj_blast);
			myExplosive.damage = bullet.blastDamage;
			myExplosive.radius = bullet.blastRadius;
			myExplosive.duration = bullet.blastDuration;
			myExplosive.dmgTick = bullet.blastDmgTick;
		}
		audio_play_sound(sfx_hit,1,false);
		gotHit = true;
}

var boom = instance_place(x,y,obj_blast);
if(boom != noone){
	gotHit = true;
	global.CRYSTAL_HP -= boom.damage;	
}

if(instance_exists(myWeapon)){
	myWeapon.x = x;
	myWeapon.y = y;
	if(instance_exists(target)) myWeapon.direction = point_direction(x,y,target.x,target.y);
}