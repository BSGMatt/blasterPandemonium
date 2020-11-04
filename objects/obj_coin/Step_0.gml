/// @description Insert description here
// You can write your code in this editor
if(x <= room_width /2){
	howFarToPush = -32;
}else{
	howFarToPush = 32;
}

if(!place_free(x,y)){
	while(!place_free(x,y)){
		x += howFarToPush;
		y += howFarToPush;
	}
}