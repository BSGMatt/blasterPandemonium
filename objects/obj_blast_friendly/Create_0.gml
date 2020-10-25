/// @description Insert description here
// You can write your code in this editor
def_damage = 10;
damage = 0;
radius = 1;
duration = 100;
dmgTick = 3;
tick = 0;
timer = 0;
blast_emit = audio_emitter_create();
audio_emitter_position(blast_emit,x,y,0);
mySound = audio_play_sound(sfx_blast,10,true);