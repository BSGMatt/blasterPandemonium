/// @description INIT GLOBAL VARIABLES
// You're probably wondering why there are 2 control objects. Well
/*in short, the original control object, for some fucking reason, kept deleting itself
whenever you game over'd. I guess the object has depression and decided to end its life. 
So, I decided to make a new one, and it somehow worked. I literally didn't change anything about the code;
the control objects are exactly the same aside from this rant, but I don't fucking care at this point. It works.
It's 2 AM, fuck me. 

*/
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
instance_create_layer(room_width/2,room_height/2,"instance_layer",obj_player);
cam = camera_create_view(0,0,1600,900,0,obj_player,-1,-1,640,360);
view_set_camera(0,cam);
if(!view_visible[0]){
	view_visible[0] = true;	
}

packRespawnTime = 30*room_speed;//seconds for a health pack to respawn

timer = packRespawnTime;

playerRespawnTime = 5*room_speed;
respawnTimer = playerRespawnTime;







