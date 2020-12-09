/// @description initialize variables
//
//push player in case he spawns on top of something.
while(!place_free(x,y)){
	if(x < room_width/2){
		x+=64;
		y+=64;
	}else{
		x-=64;
		y-=64;
	}
}


audio_listener_orientation(0,1,0,0,0,1);
audio_falloff_set_model(audio_falloff_exponent_distance);
#macro MULT_AT_HYPED 1
#macro MULT_AT_HAVING_FUN 1.25
#macro MULT_AT_BORED 0.75
#macro MULT_AT_DOB 0.5

funMultiplier = 0;

normalSpeed = 8;
myWeapon = noone;
slotPos = 0;
switched = true;
radarDir = 0;
radarTarget = noone;
maxIFrames = room_speed/4;
iFrames = 0;
invincible = false;

ammo[0] = MAX_AMMO_MAN;//MANUAL
ammo[1] = MAX_AMMO_SEMI;//SEMI
ammo[2] = MAX_AMMO_AUTO;//AUTO
/*UPGRADABLE STATS*/
hp = 200;
mspeedX = 0;//current speed
mspeedY = 0;
dashSpeed = 16;//speed when dashing
dashing = false;
maxSpeed = normalSpeed;
fireRate = 2;//the speed at which player fires
accX = 2;
accY = 2;
/*UPGRADABLE STATS*/
timer = room_speed / fireRate;//used for firing

//5/16/2020 FireRate will be removed, for all weapons will become seperate objects

if(!layer_exists("instance_layer")){
	layer_create(depth-100,"instance_layer");	
}
myfield = instance_create_layer(x,y,"instance_layer",obj_field);
