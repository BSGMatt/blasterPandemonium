// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function random_color(){
	var r = irandom(255);
	var g = irandom(255);
	var b = irandom(255);
	
	return make_color_rgb(r,g,b);
}