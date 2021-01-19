/// @description Insert description here
// You can write your code in this editor
value = 0;
mspeed = 10;
range = 128;
// You can write your code in this editor
if(x <= room_width /2){
	howFarToPush = -32;
}else{
	howFarToPush = 32;
}

if(place_meeting(x,y,all)){
	x += howFarToPush;
	y += howFarToPush;
}