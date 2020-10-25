function scr_save_game() {
	var block_count = 0;
	ds_map_clear(obj_saveLoad.state);
	ds_map_add(obj_saveLoad.state,"player_level",global.plyLevel);
	ds_map_add(obj_saveLoad.state,"player_xp",global.xp);
	ds_map_add(obj_saveLoad.state,"player_max_hp",global.plyMaxHP);
	ds_map_add(obj_saveLoad.state,"player_tier",global.PLAYER_TIER);
	ds_map_add(obj_saveLoad.state,"wave",global.WAVE);
	ds_map_add(obj_saveLoad.state,"phase",global.WAVE_PHASE);
	ds_map_add(obj_saveLoad.state,"cash",global.CURRENCY);
	ds_map_add(obj_saveLoad.state,"inv_block",global.INV_BLOCK);
	ds_map_add(obj_saveLoad.state,"inv_weapon",global.INV_WEAPON);
	ds_map_add(obj_saveLoad.state,"ifp_block",global.IFP_BLOCK);
	ds_map_add(obj_saveLoad.state,"ifp_weapon",global.IFP_WEAPON);
	ds_map_add(obj_saveLoad.state,"nsa_block",global.NSA_BLOCK);
	ds_map_add(obj_saveLoad.state,"nsa_weapon",global.NSA_WEAPON);
	//ds_map_add(obj_saveLoad.state,"block_count",instance_number(obj_block));
	for(var i = 0; i < instance_number(obj_block); i++){
		var inst = instance_find(obj_block,i);
		if(inst.object_index != obj_bPerm){
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_obj_index",inst.object_index);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_x",inst.x);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_y",inst.y);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_hp",inst.hp);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_x_scale",inst.image_xscale);
			ds_map_add(obj_saveLoad.state,"block_"+string(block_count)+"_y_scale",inst.image_yscale);
			block_count++;
			ds_map_add(obj_saveLoad.state,"block_count",block_count);
		}
	}
	ds_map_secure_save(obj_saveLoad.state,"save.txt");


}
