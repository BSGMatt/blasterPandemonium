/// @description Draw Ammo
// You can write your code in this editor
if(instance_exists(myWeapon)){
	draw_set_font(Font_HUD);
	marginX = 40;
	marginY = view_get_hport(0) - 40;
	ammoString = string(myWeapon.nickname)+": "+string(myWeapon.ammo)+" / "+string(myWeapon.ammoK);
	ammoBoxHeight = string_height(ammoString);
	ammoBoxWidth = string_width(ammoString);
	draw_rectangle_color(marginX,marginY,marginX+ammoBoxWidth,marginY+ammoBoxHeight,c_green,c_green,c_green,c_green,false);
	draw_set_halign(fa_left);
	draw_set_color(c_black);
	draw_text(marginX,marginY,ammoString);
}