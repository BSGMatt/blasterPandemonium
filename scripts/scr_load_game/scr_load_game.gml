///This script loads necessary data from the save file.
function scr_load_game() {
	
	//Define everything first, and then override any variable that needs to be updated. 
	scr_univar();
	
	show_debug_message("Loading...");
	//INIT
	obj_saveLoad.state = ds_map_secure_load("save.json");

	randomise();
	//global.plyLevel = ds_map_find_value(obj_saveLoad.state, "player_level");
	//global.PLAYER_TIER = ds_map_find_value(obj_saveLoad.state, "player_tier");
	global.plyLevel = 25;
	global.PLAYER_TIER = 4;
	global.plyHP = ds_map_find_value(obj_saveLoad.state, "player_max_hp");
	global.plyMaxHP = ds_map_find_value(obj_saveLoad.state, "player_max_hp");
	global.xp = ds_map_find_value(obj_saveLoad.state,"player_xp");



//LOAD PLAYER'S LAST POSITION 
	switch(room){
		default:
			global.CRYSTAL_SPAWN_X = room_width/2;
			global.CRYSTAL_SPAWN_Y = room_height/2;
			global.PLAYER_SPAWN_X = ds_map_find_value(obj_saveLoad.state,"player_x");
				show_debug_message("PLAYER X: "+string(global.PLAYER_SPAWN_X));
			global.PLAYER_SPAWN_Y = ds_map_find_value(obj_saveLoad.state,"player_y");
				show_debug_message("PLAYER Y: "+string(global.PLAYER_SPAWN_Y));
		break;
	}


	for(var i = 0; i < 50; i++){
		global.xpThreshold[i] = round(global.xpThreshold[0]*power((1+0.05),(4*i)));//This comes from the interest rate formula.
	}


	global.WAVE = ds_map_find_value(obj_saveLoad.state,"wave");
	
	//inventory and buying
	global.CURRENCY = ds_map_find_value(obj_saveLoad.state,"cash");

	//global.IFP_WEAPON
	for(var i=0; i < array_length(global.IFP_WEAPON); i++){
		global.IFP_WEAPON[i] = ds_map_find_value(obj_saveLoad.state,"ifp_weapon_"+string(i));
		show_debug_message(global.IFP_WEAPON[i]);
	}
	//global.IFP_BLOCK
	for(var i=0; i < array_length(global.IFP_BLOCK); i++){
		global.IFP_BLOCK[i] = ds_map_find_value(obj_saveLoad.state,"ifp_block_"+string(i));
		show_debug_message(global.IFP_BLOCK[i]);
	}
	//global.INV_BLOCK
	var blockLength = ds_map_find_value(obj_saveLoad.state, "inv_block_length");
	for(var i=0; i < blockLength; i++){
		global.INV_BLOCK[i] = ds_map_find_value(obj_saveLoad.state,"inv_block_"+string(i));
		show_debug_message(global.INV_BLOCK[i]);
	}
	//global.INV_WEAPON
	var weaponLength = ds_map_find_value(obj_saveLoad.state, "inv_weapon_length");
	for(var i=0; i < weaponLength; i++){
		global.INV_WEAPON[i] = ds_map_find_value(obj_saveLoad.state,"inv_weapon_"+string(i));
		show_debug_message(global.INV_WEAPON[i]);
	}

	global.NSA_WEAPON = ds_map_find_value(obj_saveLoad.state,"nsa_weapon");
	global.NSA_BLOCK = ds_map_find_value(obj_saveLoad.state,"nsa_block");


	//REPLACE BLOCKS
	var block_count = ds_map_find_value(obj_saveLoad.state,"block_count");
	show_debug_message("block count: "+string(block_count));
	for(var i = 0; i < block_count; i++){
		var blockX = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_x");
		var blockY = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_y");
		var inst = instance_create_layer(blockX,blockY,"instance_layer",ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_obj_index"));
		show_debug_message("BLOCK "+string(i)+"'s Object Index: "+string(inst.object_index));
		inst.image_xscale = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_x_scale");
		inst.image_yscale = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_y_scale");
		inst.fromBuilder = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_fromBuilder");
		if(inst.image_xscale > 1 or inst.image_yscale > 1) layer_add_instance("waterBlockLayer",inst);
	}


}
