/// @description Draw aiming beam
// You can write your code in this editor
radius = 250;
draw_sprite_ext(spr_player,image_index,x,y,image_xscale,image_yscale,0,c_white,image_alpha);
//draw_rectangle(x-radius,y-radius,x+radius,y+radius,true);
if(instance_exists(myWeapon)) draw_line_width_color(myWeapon.x,myWeapon.y,obj_mouse.x,obj_mouse.y,2,c_red,c_white);
draw_set_font(Font_charHeader);
if(global.WAVE_PHASE > Phase.PREP) draw_sprite_ext(spr_radar,0,x,y,1,image_yscale,radarDir,c_white,image_alpha);
//draw_text(x,y,string(mspeedX));
//draw_healthbar(x-48,y-64,x+48,y-48,(global.xp/global.xpThreshold[global.plyLevel])*100,c_black,c_teal,c_teal,0,true,true);
