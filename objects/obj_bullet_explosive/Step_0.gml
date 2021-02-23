/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hasExplosive = true;

if(timer >= lifeTime && lifeTime > -1){
	myExplosive = instance_create_depth(x,y,depth-100,obj_blast_friendly);
	myExplosive.damage = blastDamage;
	myExplosive.radius = blastRadius;
	myExplosive.duration = blastDuration;
	myExplosive.dmgTick = blastDmgTick;
	myExplosive.shakeAngle = blastShakeAngle;
	myExplosive.shakeShift = blastShakeShift;
	instance_destroy();
}else{
	timer++;	
}

