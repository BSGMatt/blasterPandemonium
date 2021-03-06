/// @description Init variables
// You can write your code in this editor
randomise();
//push place enemy out of blocks
if(x < room_width /2){
	howFarToPush = -32;
}else{
	howFarToPush = 32;
}

if(place_meeting(x,y,all)){
	x += howFarToPush;
	y += howFarToPush;
}

//COMBAT VALUES
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
myTarget = noone;
myPath = create_path(myTarget);
myDefaultPath = myPath;
myPathAction = path_action_reverse;
minCoinVal = 45;
maxCoinVal = 55;
myColor = random_color();


//AUDIO
au_emit = audio_emitter_create();
audio_emitter_position(au_emit,x,y,0);
mySound = sfx_enem_general;
audio_play_sound(mySound,99,false);

//EFFECTS
facingDirection = 0;
effect = CharacterEffect.NORMAL;
effectVal = 1;
effectDamage = 0;
effectTimer = 0;
effectChanged = false;

//STATES
enum EnemyState {
	NORMAL,
	FOLLOWING_PLAYER,
	WALKING_BACK
}

myState = EnemyState.NORMAL;


