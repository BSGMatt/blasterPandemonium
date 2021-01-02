function scr_quit_to_menu() {
	//arg0 id
	//UNPAUSE GAME
	gamePause = false;
	instance_activate_all();
	scr_save_game();
	//room_main is persistent, so it cannot be reset like other rooms. So instead i have to reset everything manually
	enemyArr = array_create(instance_number(obj_enemB),0);
	blockArr =  array_create(instance_number(obj_block),0);
	weaponEnemArr = array_create(instance_number(obj_weapon_enemy),0);
	packArr = array_create(instance_number(obj_healthpack),0);
	bulletArr = array_create(instance_number(obj_bullet),0);
	bossArr = array_create(instance_number(obj_boss),0);
	coinArr = array_create(instance_number(obj_coin),0);




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
	for(var i=0; i < instance_number(obj_coin); i++){
		var inst = instance_find(obj_coin,i);
		coinArr[i] = inst;	
	}

	//DESTROY INSTANCES
	for(var i = 0; i < array_length(enemyArr); i++){
		instance_destroy(enemyArr[i]);	
	}
	for(var i = 0; i < array_length(blockArr); i++){
		instance_destroy(blockArr[i]);	
	}
	for(var i = 0; i < array_length(weaponEnemArr); i++){
		instance_destroy(weaponEnemArr[i]);	
	}
	for(var i = 0; i < array_length(packArr); i++){
		instance_destroy(packArr[i]);	
	}
	for(var i = 0; i < array_length(bulletArr); i++){
		instance_destroy(bulletArr[i]);	
	}
	for(var i = 0; i < array_length(bossArr); i++){
		instance_destroy(bossArr[i]);	
	}
	for(var i = 0; i < array_length(coinArr); i++){
		instance_destroy(coinArr[i]);		
	}
	
	if(instance_exists(obj_boss)) instance_destroy(obj_boss);

	if(instance_exists(obj_crystal)){
		instance_destroy(obj_crystal.myWeapon);
		instance_destroy(obj_crystal);
	}

	if(timeline_exists(tm_test)) timeline_clear(tm_test);
	timeline_running = false;
	timeline_position = 0;

	//SET PLAYER POSITION
	if(instance_exists(obj_player)){
		instance_destroy(obj_player.myWeapon);
		instance_destroy(obj_player);
	}

	if(audio_is_playing(global.BGM)){
		audio_destroy_stream(global.BGM);	
	}

	scr_define_const();


	//global.LOAD_GAME_FROM_MENU = true;
	//scr_univar();//RESET EVERYTHING

	

	room_goto(rm_menu);//GOTO MAIN MENU

	instance_destroy(obj_control_copy);
}
