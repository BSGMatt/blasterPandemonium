/// @description Draw health and sprite
// You can write your code in this editor
mySprite = object_get_sprite(object_index);
draw_sprite_ext(mySprite,image_index,x,y,image_xscale,image_yscale,0,c_white,image_alpha);
draw_healthbar(x-sprite_get_width(mySprite)+8,y-sprite_get_height(mySprite),x+sprite_get_width(mySprite)-8,(y-sprite_get_height(mySprite))+(sprite_get_height(mySprite)/4),(hp/maxHealth)*100,c_black,c_blue,c_orange,0,true,true);
//draw_text(x,y,string(direction));//Debug
draw_set_color(myColor);
if (path_exists(myPath)) 
	draw_path(myPath, 0, 0, true);