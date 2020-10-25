/// @description Insert description here
// You can write your code in this editor
draw_sprite(mySprite,0,x,y);
draw_set_halign(fa_center);
draw_set_font(Font_item_title)
draw_set_color(c_black);
draw_text_ext(x,y-string_height(myString)/2,myString,string_height(myString)+4,sprite_get_width(mySprite));