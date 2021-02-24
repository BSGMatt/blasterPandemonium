/// @description - MAIN
// You can write your code in this editor
//SNAP BACK INTO BOUNDS
randomize();
audio_emitter_position(au_emit,x,y,0);

//OUT OF BOUNDS CHECK
check_for_bounds();

enemy_update_direction(obj_player);



//MOVEMENT
enemy_movement();


//EFFECTS
enemy_control_effects();



///COLLISION
//Horizontal
enemy_collide_with_terrain();


//COLLISION
//bullets
enemy_collide_with_projectiles();



enemy_push();


if(hp <= 0) {
	enemy_die();
}