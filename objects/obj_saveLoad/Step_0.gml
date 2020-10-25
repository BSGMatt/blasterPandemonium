/// @description Insert description here
// You can write your code in this editor
if(room == room_main){
	if(keyboard_check(vk_control) && keyboard_check_pressed(ord("S"))){
		scr_save_game();	
		show_message("Game has saved!");
	}	
}