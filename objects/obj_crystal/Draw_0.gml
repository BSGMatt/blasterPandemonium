/// @description Draw health and sprite
// You can write your code in this editor
depth = -500;
mySprite = object_get_sprite(object_index);
draw_sprite_ext(mySprite,0,x,y,image_xscale,image_yscale,0,myColor,image_alpha);
if(global.CRYSTAL_HP >= 0)draw_healthbar(x-sprite_get_width(mySprite)+8,y-sprite_get_height(mySprite),x+sprite_get_width(mySprite)-8,(y-sprite_get_height(mySprite))+(sprite_get_height(mySprite)/4),(global.CRYSTAL_HP/MAX_CRYSTAL_HP)*100,c_black,c_red,c_green,0,true,true);
draw_set_color(c_black);
//draw_text(x,y,string((!instance_exists(myWeapon))));//Debug
draw_circle(x,y,radius,true);