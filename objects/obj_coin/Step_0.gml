/// @description Insert description here
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) < range){
		var dir = point_direction(x,y,obj_player.x,obj_player.y);
		x += mspeed*dcos(dir);
		y += -mspeed*dsin(dir);
	}
}