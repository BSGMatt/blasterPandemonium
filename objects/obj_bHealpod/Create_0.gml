/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
healRate = 0.375;
radius = 384;
bk_emit = audio_emitter_create();
audio_emitter_position(bk_emit,x,y,0);
audio_emitter_falloff(bk_emit,radius,250+radius,1);