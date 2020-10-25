/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hasExplosive = true;

if(timer >= lifeTime && lifeTime > -1){
	var boom = instance_create_depth(x,y,depth-100,obj_blast);
	boom.damage = blastDamage;
	boom.radius = blastRadius;
	boom.duration = blastDuration;
	boom.dmgTick = blastDmgTick;
	instance_destroy();
}else{
	timer++;	
}

