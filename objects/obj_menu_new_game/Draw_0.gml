/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_menu_new_game,image_index,x,y,image_xscale,image_yscale,direction,c_white,image_alpha);
if(place_meeting(x,y,obj_mouse)){
	image_alpha = 0.5;	
}else{
	image_alpha = 1;	
}