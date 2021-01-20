/// @description Insert description here
// You can write your code in this editor
block_max_hp = 1000000;
hp = block_max_hp;
spdMod = 1;//speed modifier
colorVal = $ffffff;
blockID = -1;
fromBuilder = false;
isDestructible = true;
myWeapon = noone;
block_emit = audio_emitter_create();
audio_emitter_position(block_emit,x,y,0);
