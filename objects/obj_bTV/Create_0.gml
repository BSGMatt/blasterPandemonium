/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
radius = 384;
funRate = 0.1;
block_max_hp = 350;
hp = block_max_hp;
isDestructible = true;
bk_emit = audio_emitter_create();
audio_emitter_position(bk_emit,x,y,0);
audio_emitter_falloff(bk_emit,radius,250+radius,1);