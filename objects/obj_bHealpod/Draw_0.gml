/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(global.BUILDER_EN){
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_circle(x,y,radius,false);
	draw_set_alpha(1);
}
