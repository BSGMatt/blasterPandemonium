/// @description Rotate sprite
// You can write your code in this editor
draw_sprite_ext(object_get_sprite(object_index),0,x,y,image_xscale,image_yscale,direction,c_white,image_alpha);
draw_set_font(Font_charHeader);
draw_text(x,y,"AMMO: "+string(ammo)+" / "+string(ammoK));