/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
switch(mode){
	case NokkiMode.followPath:
		if(path_index == -1) path_start(path_boss,PATH_STD_SPEED,path_action_continue,true);
		if(path_speed == 0) path_speed = PATH_STD_SPEED;
		if(instance_exists(myWeapon)){
			myWeapon.x = x;
			myWeapon.y = y;
			if(instance_exists(obj_player)){
				target = obj_player;
			}else{
				target = obj_crystal;	
			}
			if(instance_exists(target)) myWeapon.direction = point_direction(x,y,target.x,target.y);
		}
	break;
	
	/*case ShiggyMode.targetCrystal:
		path_speed = 0;
		if(instance_exists(obj_crystal)) target = obj_crystal;
		if(instance_exists(myWeapon)){
			myWeapon.x = x;
			myWeapon.y = y;
			if(instance_exists(target)) myWeapon.direction = point_direction(x,y,target.x,target.y);
		}
	break;*/
	
	case NokkiMode.rotateWeapon:
		path_speed = 0;
		//if(instance_exists(obj_player)) target = obj_player;
		if(instance_exists(myWeapon)){
			myWeapon.x = x;
			myWeapon.y = y;
			myWeapon.direction += 360/300;
		}
	break;
}

if(timeline_position > MAX_SHIGGY_TIME) timeline_position = 0;

if(place_meeting(x+mspeedX,y,obj_bGround)){
	path_speed *= -1;
}
if(place_meeting(x,y+mspeedY,obj_bGround)){
	path_speed *= -1;
}

//COLLISION
//bullets
var inst = instance_place(x,y,obj_bullet_friendly);
if(inst != noone){
	hp -= inst.damage;
	audio_play_sound(sfx_hit,1,false);
	if(inst.hasExplosive){
		var blast = instance_create_depth(x,y,depth-100,obj_blast);
		blast.duration = inst.blastDuration;
		blast.def_damage = inst.blastDamage;
		blast.radius = inst.blastRadius;
		blast.dmgTick = inst.blastDmgTick;
	}
	instance_destroy(inst);
}

//explosions
var boom = instance_place(x,y,obj_blast);
if(boom != noone){
	hp -= boom.damage;	
	audio_play_sound(sfx_hit,1,false);
}

if(hp <= 0) {
	var inst = instance_create_depth(x,y,depth-100,obj_coin_bag);
	inst.value = irandom_range(minCoinVal,maxCoinVal);
	instance_destroy();
	instance_destroy(myWeapon);
	global.xp+=killP;
}
