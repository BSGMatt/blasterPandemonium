/// @description INIT GLOBAL VARIABLES
// You're probably wondering why this is a copy. Well
/*in short, the original control object, for some fucking reason, kept deleting itself
whenever you game over'd. I guess the object has depression and decided to end its life. 
So, I decided to make a new one, and it somehow worked. I literally didn't change anything about the code;
the control objects are exactly the same aside from this rant, but I don't fucking care at this point. It works.
It's 2 AM, fuck me. 

*/
//Variables for when a save file is loaded from the main menu, since the create is never 
/*global.LOAD_GAME_FROM_MENU = false;
global.GAME_LOADED = false;*/
scr_define_const();
if(global.LOAD_GAME){
	scr_load_game();	
}else{
	scr_univar();
}


timeline_index = tm_test;
timeline_running = false;
timeline_loop = false;
timeline_position = 0;

gamePause = false;
instance_create_layer(global.PLAYER_SPAWN_X,global.PLAYER_SPAWN_Y,"instance_layer",obj_player);
cam = camera_create_view(0,0,1920,1080,0,obj_player,-1,-1,640,360);
scr_update_level_stats();
view_set_camera(0,cam);
if(!view_visible[0]){
	view_visible[0] = true;	
}

packRespawnTime = 30*room_speed;//seconds for a health pack to respawn

timer = packRespawnTime;
blockXPTimer = 20*room_speed;

playerRespawnTime = 5*room_speed;
respawnTimer = playerRespawnTime;

//Camera Effect Functionality
shakeTimer = 30*room_speed;
shakeOk = false;

camTarget = noone;








