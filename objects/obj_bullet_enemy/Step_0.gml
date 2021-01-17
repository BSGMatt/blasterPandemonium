/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//Check for damage Modifiers. 
var block2 = instance_place(x,y,obj_block);
if(block2 != noone){
	if(block2.object_index == obj_bWater){
		damage = def_damage*block2.spdMod;
		myColor = c_blue;
	}
}
