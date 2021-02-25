// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro SHAKE_POWER 3
function scr_cam_shake(){
	var camX = camera_get_view_x(view_camera[0]) + irandom_range(-SHAKE_POWER, SHAKE_POWER);
	var camY = camera_get_view_y(view_camera[0])  + irandom_range(-SHAKE_POWER, SHAKE_POWER);
	camera_set_view_pos(view_camera[0],camX,camY);
	var mult = -1;
	if(irandom(1) == 1) mult = 1;	
	camera_set_view_angle(view_camera[0], mult*irandom_range(1,SHAKE_POWER));
}

function scr_cam_shake_params(posIntensity, angleIntensity){
	if(angleIntensity == 0) return;
	var camX = camera_get_view_x(view_camera[0]) + irandom_range(-posIntensity, posIntensity);
	var camY = camera_get_view_y(view_camera[0])  + irandom_range(-posIntensity, posIntensity);
	camera_set_view_pos(view_camera[0],camX,camY);
	var intensity = random_range(1,angleIntensity);
	if(irandom(1) == 1) intensity *= -1;			
	camera_set_view_angle(view_camera[0], intensity);
}

function scr_cam_reset(){

	camera_set_view_angle(view_camera[0], 0);
}

