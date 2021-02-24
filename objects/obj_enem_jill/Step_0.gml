/// @description - MAIN
// You can write your code in this editor
myWeapon.spread = irandom_range(0,30);
//Direction

enemy_update_direction(obj_crystal);

enemy_control_effects();

if(instance_exists(obj_crystal)){
	mspeedX = maxSpeed*dcos(direction);
	mspeedY = -maxSpeed*dsin(direction);
}

//when you see my face hope it gives you hell
if(distance_to_object(obj_crystal) <= spaceFromCrystal){
	mspeedX = 0;
	mspeedY = 0;
}

enemy_collide_with_projectiles();

enemy_collide_with_terrain();

enemy_push();

if(hp <= 0) {
	enemy_die();
}