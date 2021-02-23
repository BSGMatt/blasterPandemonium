/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
blockID = buildingID.dashpad_std;
spdMod = 2;
if(instance_exists(myWeapon)){
	myWeapon.damage = 0;
	myWeapon.fireRate = 2*room_speed;
	myWeapon.pelletVelocity = 60;
	myWeapon.pelletType = obj_bullet_enemy;
	myWeapon.effect = CharacterEffect.BOOSTED;
}