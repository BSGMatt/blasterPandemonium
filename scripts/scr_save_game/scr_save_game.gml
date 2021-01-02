function scr_save_game() {
	show_debug_message("Saving...");
	var block_count = 0;
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
	
	var invBList = ds_list_create();
	for(var i = 0; i < array_length(global.INV_BLOCK); i++){
		ds_list_add(invBList,global.INV_BLOCK[i])
		show_debug_message("INV_BLOCK's Length: "+string(array_length(global.INV_BLOCK)));
		show_debug_message("INV_BLOCK Value at "+string(i)+": "+string(global.INV_BLOCK[i]));		
	}
	ds_map_add_list(obj_saveLoad.state,"inv_block",invBList);
	show_debug_message("INV_BLOCK"+string(invBList));
	//ds_map_add(obj_saveLoad.state,"inv_block",global.INV_BLOCK);
	
	var invBWeapon = ds_list_create();
	for(var i = 0; i < array_length(global.INV_WEAPON); i++){
		ds_list_add(invBWeapon,global.INV_WEAPON[i]);
		show_debug_message("INV_WEAPON's Length: "+string(array_length(global.INV_WEAPON)));
		show_debug_message("INV_WEAPON Value at "+string(i)+": "+string(global.INV_WEAPON[i]));
	}
	ds_map_add_list(obj_saveLoad.state,"inv_weapon",invBWeapon);
	show_debug_message("INV_WEAPON"+string(invBWeapon));
	
	//ds_map_add(obj_saveLoad.state,"inv_weapon",global.INV_WEAPON);
	
	var ifpBlock = ds_list_create();
	for(var i = 0; i < array_length(global.IFP_BLOCK); i++){
		ds_list_add(ifpBlock,global.IFP_BLOCK[i])
		show_debug_message("IFP_BLOCK's Length"+string(array_length(global.IFP_BLOCK)));
		show_debug_message("IFP_BLOCK"+string(global.IFP_BLOCK[i]));	
	}
	ds_map_add_list(obj_saveLoad.state,"ifp_block",ifpBlock);
	//ds_map_add(obj_saveLoad.state,"ifp_block",global.IFP_BLOCK);

	var ifpWeapon = ds_list_create();
	for(var i = 0; i < array_length(global.IFP_BLOCK); i++) ds_list_add(ifpWeapon,global.IFP_BLOCK[i]);
	ds_map_add_list(obj_saveLoad.state,"ifp_weapon",ifpWeapon);
	show_debug_message("INV_WEAPON"+string(ifpWeapon));	
	//ds_map_add(obj_saveLoad.state,"ifp_weapon",global.IFP_WEAPON);
	
	
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
			block_count++;
			
	}
	ds_map_add(obj_saveLoad.state,"block_count",block_count);
	//WRITING DATA TO FILE
	/*var j = json_encode(obj_saveLoad.state);
	show_debug_message(j);
	var file = file_text_open_write(working_directory+"save.txt");
	show_debug_message(working_directory);
	file_text_write_string(file,j);
	file_text_close(file);*/
	ds_map_secure_save(obj_saveLoad.state,"save.json");


}
