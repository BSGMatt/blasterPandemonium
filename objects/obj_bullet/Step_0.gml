
/// @description Interactions
// You can write your code in this editor
var block = instance_place(x,y,obj_block);
if(block != noone){
	velX = def_velX * block.spdMod;
	velY = def_velY * block.spdMod;
}else{
	velX = def_velX;
	velY = def_velY;
}
x += velX;
y += velY;

if(instance_place(x,y,obj_bPerm)) instance_destroy();