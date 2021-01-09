/// @description Init variables
// You can write your code in this editor
#macro TOLERANCE 64
randomise();
//push place enemy out of blocks
if(x < room_width /2){
	howFarToPush = -32;
}else{
	howFarToPush = 32;
}

if(place_meeting(x,y,obj_block)){
	while(!place_meeting(x,y,obj_block)){
		x += howFarToPush;
		y += howFarToPush;
	}
}
myWeapon = noone;
maxHealth = 100;
hp = maxHealth;
killP = 200;//points given when player kills enemy
maxSpeed = 3;
mspeedX = maxSpeed; 
mspeedY = maxSpeed;
moveX = 0;
moveY = 0;
radius = 250;
onPath = false;
myPath = path_basic;
minCoinVal = 45;
maxCoinVal = 55;
//path_start(myPath,maxSpeed,path_action_continue,false);
au_emit = audio_emitter_create();
audio_emitter_position(au_emit,x,y,0);
mySound = sfx_enem_general;
audio_play_sound(mySound,99,false);
facingDirection = 0;


