/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//Check for blocks with speed modifiers. 
var block = instance_place(x,y,obj_block);
if(block != noone){
	if(block.object_index == obj_bDashpad){
		damage = def_damage * block.spdMod;
		myColor = c_yellow;
	}
}
