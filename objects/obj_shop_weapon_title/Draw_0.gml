/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(mySprite,0,x,y,1.625,2,0,c_white,image_alpha);
draw_set_halign(fa_center);
draw_set_font(Font_item_title)
draw_set_color(c_black);
draw_text_ext(x,y-string_height(myString)/2,myString,string_height(myString)*.75,sprite_get_width(mySprite));