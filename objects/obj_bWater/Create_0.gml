/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
blockID = buildingID.block_water;
spdMod = 0.5;
if(instance_exists(myWeapon)){
	myWeapon.damage = 0;
	myWeapon.fireRate = room_speed;
	myWeapon.pelletVelocity = 10;
	myWeapon.pelletType = obj_bullet_friendly;
	myWeapon.effect = CharacterEffect.SLOWED;
}