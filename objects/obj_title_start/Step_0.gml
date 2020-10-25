/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player)) instance_destroy(obj_player);
if(room == rm_menu){
	if(keyboard_check_pressed(vk_enter)) {
		room_goto_next();
	}
}