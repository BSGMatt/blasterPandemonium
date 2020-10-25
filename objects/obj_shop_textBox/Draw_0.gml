/// @description Insert description here
// You can write your code in this editor
var spacing = -40;
draw_sprite(mySprite,0,x,y);
draw_set_halign(fa_center);
draw_set_font(Font_shop_description);
for(var i = 0; i < array_length_1d(myString); i++){
	draw_text_ext(x,spacing+y-(sprite_get_height(mySprite)/4),myString[i],string_height(myString[i]),4*sprite_get_width(mySprite)/5);
	spacing += 30;
}