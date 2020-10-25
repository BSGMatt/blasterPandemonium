/// @description Insert description here
// You can write your code in this editor
draw_set_font(Font_HUD);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
view_xport[view_current] = 0;
view_yport[view_current] = 0;
var viewX = view_xport[view_current];
var viewY = view_yport[view_current];
var camW = view_get_wport(0);
var camH = view_get_hport(0);
draw_set_alpha(1);
draw_set_color(c_white);
var spacing = 0;
for(var i = 0; i < array_length_1d(textString); i++){
	draw_text_ext_color(viewX+camW/2,spacing+viewY+camH/4,textString[i],string_height(textString[i])+4,camW/2,c_white,c_white,c_white,c_white,textAlpha[i]);
	spacing+=camH/4
}

//draw_text(x,y,string(viewX+huh)+","+string(viewY+ugh));
draw_set_alpha(boxAlpha);
draw_set_color(c_black);
draw_rectangle_color(viewX,viewY,viewX+camW,viewY+camH,c_black,c_black,c_black,c_black,false);