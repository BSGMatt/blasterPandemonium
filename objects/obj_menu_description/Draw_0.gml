/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font_menu_description);
draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_sprite(spr_menu_description,image_index,x,y);
//The number 80 comes from the distance between the inner portion and the actual width of the sprite. 
//700 is the width and height of the inner portion (light grey part) of the sprite. 
draw_text_ext(x,y,myString,(2*string_height(myString))/3,700);