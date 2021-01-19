function scr_save_game() {
	show_debug_message("Saving...");
	var block_count = 0;
	var inv_weapon_length = 0;
	var inv_block_length = 0;
	ds_map_clear(obj_saveLoad.state);
	ds_map_add(obj_saveLoad.state,"player_level",global.plyLevel);
	ds_map_add(obj_saveLoad.state,"player_xp",global.xp);
	ds_map_add(obj_saveLoad.state,"player_max_hp",global.plyMaxHP);
	ds_map_add(obj_saveLoad.state,"player_tier",global.PLAYER_TIER);
	ds_map_add(obj_saveLoad.state,"wave",global.WAVE);
	ds_map_add(obj_saveLoad.state,"phase",global.WAVE_PHASE);
	ds_map_add(obj_saveLoad.state,"cash",global.CURRENCY);
	ds_map_add(obj_saveLoad.state,"player_x",obj_player.x);
	ds_map_add(obj_saveLoad.state,"player_y",obj_player.y);
	
	for(var i = 0; i < array_length(global.INV_BLOCK); i++){	
		ds_map_add(obj_saveLoad.state,"inv_block_"+string(i),global.INV_BLOCK[i]);
		inv_block_length++;
		show_debug_message("INV_BLOCK at value "+string(i)+": "+string(global.INV_BLOCK[i]));	
	}
	ds_map_add(obj_saveLoad.state,"inv_block_length",inv_block_length);
	
	for(var i = 0; i < array_length(global.INV_WEAPON); i++){
		ds_map_add(obj_saveLoad.state,"inv_weapon_"+string(i),global.INV_WEAPON[i]);
		inv_weapon_length++;
		show_debug_message("INV_WEAPON at value "+string(i)+": "+string(global.INV_WEAPON[i]));
	}
	ds_map_add(obj_saveLoad.state,"inv_weapon_length",inv_weapon_length);
	
	for(var i = 0; i < array_length(global.IFP_BLOCK); i++){
		ds_map_add(obj_saveLoad.state,"ifp_block_"+string(i),global.IFP_BLOCK[i]);
		show_debug_message("IFP_BLOCK at value "+string(i)+": "+string(global.IFP_BLOCK[i]));	
	}

	for(var i = 0; i < array_length(global.IFP_WEAPON); i++){
		ds_map_add(obj_saveLoad.state,"ifp_weapon_"+string(i),global.IFP_WEAPON[i]);
		show_debug_message("IFP_BLOCK at value "+string(i)+": "+string(global.IFP_WEAPON[i]));	
	}
	
	
	ds_map_add(obj_saveLoad.state,"nsa_block",global.NSA_BLOCK);
	ds_map_add(obj_saveLoad.state,"nsa_weapon",global.NSA_WEAPON);
	//ds_map_add(obj_saveLoad.state,"block_count",instance_number(obj_block));
	for(var i = 0; i < instance_number(obj_block); i++){
		var inst = instance_find(obj_block,i);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_obj_index",inst.object_index);
			show_debug_message("Getting Block "+string(block_count)+"'s index: "+string(inst.object_index));
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_x",inst.x);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_y",inst.y);
			show_debug_message("Block's Y: "+string(inst.y));
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_hp",inst.hp);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_x_scale",inst.image_xscale);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_y_scale",inst.image_yscale);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_fromBuilder",inst.fromBuilder);
			block_count++;
			
	}
	ds_map_add(obj_saveLoad.state,"block_count",block_count);
	show_debug_message("Block Count"+string(block_count));
	//WRITING DATA TO FILE
	/*var j = json_encode(obj_saveLoad.state);
	show_debug_message(j);
	var file = file_text_open_write(working_directory+"save.txt");
	show_debug_message(working_directory);
	file_text_write_string(file,j);
	file_text_close(file);*/
	ds_map_secure_save(obj_saveLoad.state,"save.json");


}
