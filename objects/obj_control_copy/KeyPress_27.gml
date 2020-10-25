/// @description Pause Game
//GET VIEW COORDS
viewX = view_get_xport(0);
viewY = view_get_yport(0);
////////////////////////////

if(gamePause == false){
	//PAUSE GAME
	instance_deactivate_all(true);
	gamePause = true;	
	timeline_running = false;	
	
	//
}else{
	instance_activate_all();
	gamePause = false;

	if(global.WAVE_PHASE == Phase.SWARM) timeline_running = true;
}
