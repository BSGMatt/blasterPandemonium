///This script declares all global variables. 
function scr_load_game() {
	
	//INIT
	obj_saveLoad.state = ds_map_secure_load("save.json");

	randomise();
	global.plyLevel = ds_map_find_value(obj_saveLoad.state, "player_level");
	global.PLAYER_TIER = ds_map_find_value(obj_saveLoad.state, "player_tier");
	global.plyHP = ds_map_find_value(obj_saveLoad.state, "player_max_hp");
	global.plyMaxHP = ds_map_find_value(obj_saveLoad.state, "player_max_hp");
	global.currentEnemyKills = 0;
	global.packHealing = 50;
	global.xp = ds_map_find_value(obj_saveLoad.state,"player_xp");
	global.xpThreshold[0] = 500;
	global.FUN = 100;
	global.CRYSTAL_HP = 1000;
	global.PLAYER_DIED = false;
	/*#macro MAX_CRYSTAL_HP 1000
#macro MAX_FUN 120
#macro FUN_TICK_RATE .0150//RATE OF FUN OVER TIME
#macro CRYSTAL_HPS 25*/




	switch(room){
		default:
			global.CRYSTAL_SPAWN_X = room_width/2;
			global.CRYSTAL_SPAWN_Y = room_height/2;
			global.PLAYER_SPAWN_X = ds_map_find_value(obj_saveLoad.state,"player_x");
			global.PLAYER_SPAWN_Y = ds_map_find_value(obj_saveLoad.state,"player_y");
		break;
	}


	for(var i = 0; i < 50; i++){
		global.xpThreshold[i] = round(global.xpThreshold[0]*power((1+0.05),(4*i)));//This comes from the interest rate formula.
	}

	//PHASE ENUM
	/*enum Phase{
		IDLE = -1,
		PREP = 0,
		SWARM = 1,
		BOSS = 2
	}*/

	//WEAPON ENUM
	/*enum weaponID{
		std_pistol = 0,
		std_shotgun = 1,
		std_sniper = 2,
		std_ak = 3,
		std_sine = 4,
		std_grenade_launcher = 5,
		super_pistol = 6,
		super_shotgun = 7,
		super_ak = 8
	}

	enum weaponType{
		manual= 0,
		semi = 1,
		auto = 2
	}

	//BUILDING ENUMS
	enum buildingID{
		block_std = 0,
		turret_std = 2,
		block_water = 1,
		dashpad_std = 3,
		tv_std = 4,
		block_super = 5,
		turret_super = 6,
		healpod_std = 7
	}*/

	//#macro PREP_TIME room_speed*60;

	global.WAVE = ds_map_find_value(obj_saveLoad.state,"wave");
	global.WAVE_PHASE = Phase.IDLE;
	global.TIMER = PREP_TIME;//60 seconds
	global.WAVE_STARTED = false;
	//0 = prep phase, 1 = attack phase, boss phase;

	//inventory and buying
	global.CURRENCY = ds_map_find_value(obj_saveLoad.state,"cash");

	global.WEAPONS_AVAILABLE_AT_TIER[0] = 4;
	global.WEAPONS_AVAILABLE_AT_TIER[1] = 7;
	global.WEAPONS_AVAILABLE_AT_TIER[2] = 10;
	global.WEAPONS_AVAILABLE_AT_TIER[3] = 10;
	global.WEAPONS_AVAILABLE_AT_TIER[4] = 10;

	global.BLOCKS_AVAILABLE_AT_TIER[0] = 2;
	global.BLOCKS_AVAILABLE_AT_TIER[1] = 6;
	global.BLOCKS_AVAILABLE_AT_TIER[2] = 8;
	global.BLOCKS_AVAILABLE_AT_TIER[3] = 8;
	global.BLOCKS_AVAILABLE_AT_TIER[4] = 8;

	global.BUILDER_EN = false;
	global.IFP_WEAPON = array_create(12, false);//IFP stands for "Items For Purchase";
	global.IFP_BLOCK = array_create(12, false);//IFP stands for "Items For Purchase";
	global.PRICES_W = array_create(12, 100);
	global.PRICES_B = array_create(12, 100);

	global.W_OR_B = false;//W=true,B=false

	global.INV_WEAPON[0] = -1;
	global.INV_BLOCK[0] = -1;

	//write values from ds_list into the global arrays
	//global.IFP_WEAPON
	var ifp_weapon_array = ds_list_create();
	ds_list_copy(ifp_weapon_array,ds_map_find_value(obj_saveLoad.state,"ifp_weapon"));
	show_debug_message(ifp_weapon_array);
	for(var i=0; i < array_length(global.IFP_WEAPON); i++){
		global.IFP_WEAPON[i] = ds_list_find_value(ifp_weapon_array,i);	
		show_debug_message(global.IFP_WEAPON[i]);
	}
	//global.IFP_BLOCK
	var ifp_block_array = ds_list_create();
	ds_list_copy(ifp_block_array,ds_map_find_value(obj_saveLoad.state,"ifp_block"));
	for(var i=0; i < array_length(global.IFP_BLOCK); i++){
		global.IFP_BLOCK[i] = ds_list_find_value(ifp_block_array,i);	
	}
	//global.INV_BLOCK
	var inv_block_array = ds_list_create();
	ds_list_copy(inv_block_array,ds_map_find_value(obj_saveLoad.state,"inv_block"));
	for(var i=0; i < array_length(global.INV_BLOCK); i++){
		global.INV_BLOCK[i] = ds_list_find_value(inv_block_array,i);	
	}
	//global.INV_WEAPON
	var inv_weapon_array = ds_list_create();
	ds_list_copy(inv_weapon_array,ds_map_find_value(obj_saveLoad.state,"inv_weapon"));
	for(var i=0; i < array_length(global.INV_WEAPON); i++){
		global.INV_WEAPON[i] = ds_list_find_value(inv_weapon_array,i);	
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
		show_debug_message(string(inst.object_index));
		inst.image_xscale = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_x_scale");
		inst.image_yscale = ds_map_find_value(obj_saveLoad.state,"block_"+string(i)+"_y_scale");
		if(inst.image_xscale > 1 or inst.image_yscale > 1) layer_add_instance("waterBlockLayer",inst);
	}


	//C - tier
	global.PRICES_W[weaponID.std_pistol] = 0;
	global.PRICES_W[weaponID.std_shotgun] = 100;
	global.PRICES_W[weaponID.std_sniper] = 150;
	global.PRICES_W[weaponID.std_ak] = 200;
	//B - tier
	global.PRICES_W[weaponID.std_sine] = 300;
	global.PRICES_W[weaponID.std_grenade_launcher] = 450;
	global.PRICES_W[weaponID.quirky_ak] = 500;
	//A - tier
	global.PRICES_W[weaponID.super_pistol] = 600;
	global.PRICES_W[weaponID.super_shotgun] = 600;
	global.PRICES_W[weaponID.super_ak] = 600;

	global.WEAPONS_AVAILABLE_AT_TIER[4] = array_length(global.PRICES_W);
	//I put this here to prevent an out-of-bounds error in the shop. 
	//C - tier
	global.PRICES_B[buildingID.block_std] = 0;
	global.PRICES_B[buildingID.block_water] = 50;
	global.PRICES_B[buildingID.tv_std] = 125;
	//B - tier
	global.PRICES_B[buildingID.turret_std] = 150;
	global.PRICES_B[buildingID.dashpad_std] = 200;
	global.PRICES_B[buildingID.healpod_std] = 250;
	//A - tier
	global.PRICES_B[buildingID.block_super] = 250;
	global.PRICES_B[buildingID.turret_super] = 250;



	global.BLDNG_PRICES[buildingID.block_std] = 25;
	global.BLDNG_PRICES[buildingID.block_water] = 25;
	global.BLDNG_PRICES[buildingID.tv_std] = 25;
	global.BLDNG_PRICES[buildingID.turret_std] = 50;
	global.BLDNG_PRICES[buildingID.dashpad_std] = 50;
	global.BLDNG_PRICES[buildingID.block_super] = 75;
	global.BLDNG_PRICES[buildingID.turret_super] = 75;
	global.BLDNG_PRICES[buildingID.healpod_std] = 50;



	//PRICES_B will be the cost to UNLOCK the block, while BLDNG_PRICES will be the cost to BUILD it

	//#macro REFUND_RATE 0.75

	//enemy populations for each wave
	global.ENEM_POP = array_create(100,0);
	global.ENEM_POP[0] = 5;
	global.ENEM_POP[1] = 8;
	global.ENEM_POP[2] = 10;
	global.ENEM_POP[3] = 15;
	for(var i = 4; i < array_length(global.ENEM_POP); i++){
		if(global.ENEM_POP[i-1] < 30) {
			global.ENEM_POP[i] = global.ENEM_POP[i-1]+3;
		}else global.ENEM_POP[i] = 20;
	}

	//Checking enemy count
	global.enemyCount = global.ENEM_POP[0];
	//BOSS
	global.BOSS_SPAWNED = false;
	global.BOSS_EXISTS = false;

	///AUDIO
	//Set # of channels
	audio_channel_num(32);//32 Max sounds can play
	//Play main theme
	global.BGM = 0;

	//Music Enum
	/*enum Music{
		MENU = 0,
		PREP = 1,
		SWARM = 2,
		BOSS = 3,
		VICTORY = 4
	}*/


	/*#macro MAX_AMMO_MAN 10
#macro MAX_AMMO_SEMI 25
#macro MAX_AMMO_AUTO 50*/


}
