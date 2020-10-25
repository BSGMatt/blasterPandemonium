/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(global.WAVE > 24){
	maxHealth = 1300;
	hp = maxHealth;
	mspeed = 7;
	myPath = path_boss_harder;
	path_scale = 2;
	path_start(path_boss,mspeed,path_action_continue,true);
	myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob_hard);
	swapTimer = 1.5*room_speed;
}else if(global.WAVE > 18){
	maxHealth = 1100;
	hp = maxHealth;
	mspeed = 6;
	myPath = path_boss_harder;
	path_scale = 1.75;
	path_start(path_boss,mspeed,path_action_continue,true);
	if(global.WAVE > 21)
		myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob_hard);
	else
		myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob_med);
	swapTimer = 1.87*room_speed;
}else if(global.WAVE > 12){
	maxHealth = 900;
	hp = maxHealth;
	mspeed = 5;
	myPath = path_boss_harder;
	path_scale = 1.5;
	path_start(path_boss,mspeed,path_action_continue,true);
	myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob_med);
	swapTimer = 2.25*room_speed;
}else if(global.WAVE > 6){
	maxHealth = 700;
	hp = maxHealth;
	mspeed = 4;
	myPath = path_boss;
	path_scale = 1.25;
	path_start(path_boss,mspeed,path_action_continue,true);
	if(global.WAVE > 9)
		myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob_med);
	else
		myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob);
	swapTimer = 2.625*room_speed;
}else{
	maxHealth = 600;
	hp = maxHealth;
	mspeed = 3;
	myPath = path_boss;
	path_scale = 1;
	path_start(path_boss,mspeed,path_action_continue,true);
	myWeapon = instance_create_layer(x,y,"instance_layer",obj_weapon_boss_bob);
	swapTimer = 3*room_speed;
}

mySound = sfx_enem_boss;
audio_play_sound(mySound,99,false);
