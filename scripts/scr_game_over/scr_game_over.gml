function scr_game_over() {
	//arg0 id
	//room_main is persistent, so it cannot be reset like other rooms. So instead i have to reset everything manually
	enemyArr = array_create(instance_number(obj_enemB),0);
	blockArr =  array_create(instance_number(obj_block),0);
	weaponEnemArr = array_create(instance_number(obj_weapon_enemy),0);
	packArr = array_create(instance_number(obj_healthpack),0);
	bulletArr = array_create(instance_number(obj_bullet),0);
	bossArr = array_create(instance_number(obj_boss),0);

	//COLLECT IDs
	for(var i=0; i < instance_number(obj_enemB); i++){
		var inst = instance_find(obj_enemB,i);	
		enemyArr[i] = inst;
	}
	for(var i=0; i < instance_number(obj_weapon_enemy); i++){
		var inst2 = instance_find(obj_weapon_enemy,i);	
		weaponEnemArr[i] = inst2;	
	}
	for(var i=0; i < instance_number(obj_block); i++){
		var inst = instance_find(obj_block,i);
		if(inst.fromBuilder == true) blockArr[i] = inst;
	}
	for(var i=0; i < instance_number(obj_healthpack); i++){
		var inst = instance_find(obj_healthpack,i);	
		packArr[i] = inst;
	}
	for(var i=0; i < instance_number(obj_bullet); i++){
		var inst = instance_find(obj_bullet,i);	
		bulletArr[i] = inst;
	}
	for(var i=0; i < instance_number(obj_boss); i++){
		var inst = instance_find(obj_boss,i);	
		bossArr[i] = inst;
	}

	//DESTROY INSTANCES
	for(var i = 0; i < array_length_1d(enemyArr); i++){
		instance_destroy(enemyArr[i]);	
	}
	for(var i = 0; i < array_length_1d(blockArr); i++){
		instance_destroy(blockArr[i]);	
	}
	for(var i = 0; i < array_length_1d(weaponEnemArr); i++){
		instance_destroy(weaponEnemArr[i]);	
	}
	for(var i = 0; i < array_length_1d(packArr); i++){
		instance_destroy(packArr[i]);	
	}
	for(var i = 0; i < array_length_1d(bulletArr); i++){
		instance_destroy(bulletArr[i]);	
	}
	for(var i = 0; i < array_length_1d(bossArr); i++){
		instance_destroy(bossArr[i]);	
	}

	if(instance_exists(obj_crystal)){
		instance_destroy(obj_crystal.myWeapon);
		instance_destroy(obj_crystal);
	}

	if(timeline_exists(tm_test)) timeline_clear(tm_test);
	timeline_running = false;

	//SET PLAYER POSITION
	if(instance_exists(obj_player)){
		obj_player.x = room_width/2;
		obj_player.y = room_height/2;
		instance_destroy(obj_player.myWeapon);
		instance_destroy(obj_player.myfield);
	}

	if(audio_is_playing(global.BGM)){
		audio_destroy_stream(global.BGM);	
	}


	/*scr_define_const();
	scr_univar();//RESET EVERYTHING*/


	room_goto(rm_game_over);//GOTO GAME OVER SCREEN
	instance_destroy(obj_control_copy);


}
