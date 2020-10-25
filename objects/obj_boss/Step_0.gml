/// @description - MAIN
// You can write your code in this editor

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


//This code right determines the direction the enemy will go, basically replace the key inputs the player has. 
if(place_meeting(x,y,obj_field)){
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
	if(distToNearestPoint < RETURN_TO_POINT_LEEWAY) {
		if(path_index == -1) path_start(myPath,maxSpeed,path_action_continue,true);
		onPath = true;
	}else{
		//search for the closest point on the path the boss can travel to.
			var minDist = 100000;
			var pointX = 0, pointY = 0;
			for(var i = 0; i < path_get_number(myPath); i++){
				var dist = point_distance(x,y,path_get_point_x(myPath,i),path_get_point_y(myPath,i));
				if(dist < minDist){
					minDist = dist;
					pointX = path_get_point_x(myPath,i);
					pointY = path_get_point_y(myPath,i);
				}
			}
	
			//move boss towards that point
			moveX = dcos(point_direction(x,y,pointX,pointY));
			moveY = dsin(point_direction(x,y,pointX,pointY));
	
	
			distToNearestPoint = minDist;	
	}
}

mspeedX = moveX*maxSpeed;
mspeedY = moveY*maxSpeed;

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
var block = instance_place(x,y,obj_block)
if(block != noone){
	var modifier = block.spdMod;
	if(onPath){
		path_speed  = maxSpeed*modifier;	
	}else{
		mspeedX = sign(mspeedX)*modifier;
		mspeedY = sign(mspeedY)*modifier;
	}	
}

x += mspeedX;
y += mspeedY;

if(instance_exists(myWeapon)){
	myWeapon.x = x - (sprite_width/2);
	myWeapon.y = y;
	if(instance_exists(target)) myWeapon.direction = point_direction(x,y,target.x,target.y);
	//TARGETS WILL CHANGE DEPENDING ON THE BOSS'S NEHAVIOR
}

if(hp <= 0) {
	var inst = instance_create_depth(x,y,depth-100,obj_coin_bag);
	inst.value = irandom_range(minCoinVal,maxCoinVal);
	instance_destroy();
	instance_destroy(myWeapon);
	global.xp+=killP;
}
