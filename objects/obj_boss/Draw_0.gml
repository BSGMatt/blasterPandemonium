/// @description Draw health and sprite
// You can write your code in this editor
mySprite = object_get_sprite(object_index);
draw_sprite(mySprite,0,x,y);
draw_healthbar(x-sprite_get_width(mySprite)+8,y-sprite_get_height(mySprite),x+sprite_get_width(mySprite)-8,(y-sprite_get_height(mySprite))+(sprite_get_height(mySprite)/4),(hp/maxHealth)*100,c_black,c_blue,c_orange,0,true,true);
draw_text(x,y,string(path_get_point_x(myPath,0))+" "+string(path_get_point_y(myPath,0)));//Debug