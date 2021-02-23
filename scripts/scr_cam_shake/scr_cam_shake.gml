// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro SHAKE_POWER 3
function scr_cam_shake(){
	var camX = camera_get_view_x(view_camera[0]) + irandom_range(-SHAKE_POWER, SHAKE_POWER);
	var camY = camera_get_view_y(view_camera[0])  + irandom_range(-SHAKE_POWER, SHAKE_POWER);
	camera_set_view_pos(view_camera[0],camX,camY);
	camera_set_view_angle(view_camera[0], irandom_range(-SHAKE_POWER,SHAKE_POWER));
}

function scr_cam_shake_params(posIntensity, angleIntensity){
	var camX = camera_get_view_x(view_camera[0]) + irandom_range(-posIntensity, posIntensity);
	var camY = camera_get_view_y(view_camera[0])  + irandom_range(-posIntensity, posIntensity);
	camera_set_view_pos(view_camera[0],camX,camY);
	camera_set_view_angle(view_camera[0], random_range(-angleIntensity,angleIntensity));
}

function scr_cam_reset(){

	camera_set_view_angle(view_camera[0], 0);
}

