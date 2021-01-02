/// @description Check if control object exists. 
if(room == room_main){
	if(!instance_exists(obj_control_copy)){
		instance_create_layer(0,0,"instance_layer",obj_control_copy);
	}
}
