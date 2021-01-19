///This script declares all global variables. 
function scr_univar() {
	//INIT
	randomise();
	global.plyLevel = 0;
	global.PLAYER_TIER = 0;
	global.plyMaxHP = 200;
	global.plyHP = global.plyMaxHP;
	global.currentEnemyKills = 0;
	global.packHealing = 50;
	global.xp = 0;
	global.xpThreshold[0] = 500;
	global.FUN = 100;
	global.CRYSTAL_HP = MAX_CRYSTAL_HP;
	global.PLAYER_DIED = false;
	/*#macro MAX_CRYSTAL_HP 1000
#macro MAX_FUN 120
#macro FUN_TICK_RATE .0150//RATE OF FUN OVER TIME
#macro CRYSTAL_HPS 25*/




	switch(room){
		default:
			global.CRYSTAL_SPAWN_X = room_width/2;
			global.CRYSTAL_SPAWN_Y = room_height/2;
			global.PLAYER_SPAWN_X = room_width/2;
			global.PLAYER_SPAWN_Y = room_height/2;
		break;
	}


	for(var i = 0; i < 50; i++){
		global.xpThreshold[i] = round(global.xpThreshold[0]*exp(0.152*i));
	}

	global.WAVE = 0;
	global.WAVE_PHASE = Phase.IDLE;
	global.TIMER = PREP_TIME;
	global.WAVE_STARTED = false;
	//0 = prep phase, 1 = attack phase, boss phase;

	//inventory and buying
	global.CURRENCY  = 750;

	global.WEAPONS_AVAILABLE_AT_TIER[0] = 3;
	global.WEAPONS_AVAILABLE_AT_TIER[1] = 6;
	global.WEAPONS_AVAILABLE_AT_TIER[2] = 9;
	global.WEAPONS_AVAILABLE_AT_TIER[3] = 12;
	global.WEAPONS_AVAILABLE_AT_TIER[4] = 15;
	
	//COMMENT OUT THE CODE BELOW WHEN NOT DEBUGGING
	/*for(var i=0; i < array_length(global.WEAPONS_AVAILABLE_AT_TIER); i++){
		array_set(global.WEAPONS_AVAILABLE_AT_TIER,i,15);
	}*/

	global.BLOCKS_AVAILABLE_AT_TIER[0] = 3;
	global.BLOCKS_AVAILABLE_AT_TIER[1] = 6;
	global.BLOCKS_AVAILABLE_AT_TIER[2] = 8;
	global.BLOCKS_AVAILABLE_AT_TIER[3] = 8;
	global.BLOCKS_AVAILABLE_AT_TIER[4] = 8;

	//COMMENT OUT THE CODE BELOW WHEN NOT DEBUGGING
	/*for(var i=0; i < array_length(global.BLOCKS_AVAILABLE_AT_TIER); i++){
		array_set(global.BLOCKS_AVAILABLE_AT_TIER,i,15);
	}*/

	global.BUILDER_EN = false;
	global.IFP_WEAPON = array_create(20, false);//IFP stands for "Items For Purchase";
	global.IFP_BLOCK = array_create(20, false);//IFP stands for "Items For Purchase";
	global.PRICES_W = array_create(20, 100);
	global.PRICES_B = array_create(20, 100);

	global.W_OR_B = false;//W=true,B=false
	global.NSA_WEAPON = 0;//STANDS FOR "NEXT SLOT AVAILABLE";
	global.NSA_BLOCK = 0;
	global.INV_WEAPON[global.NSA_WEAPON] = -1;
	global.INV_BLOCK[global.NSA_BLOCK] = -1;


	//set prices for items
	//F - tier
	global.PRICES_W[weaponID.std_pistol] = 0;
	global.PRICES_W[weaponID.std_shotgun] = 100;
	global.PRICES_W[weaponID.std_sniper] = 150;
	//D - tier
	global.PRICES_W[weaponID.std_ak] = 300;
	global.PRICES_W[weaponID.std_sine] = 400;
	global.PRICES_W[weaponID.std_grenade_launcher] = 450;
	//C - tier
	global.PRICES_W[weaponID.quirky_ak] = 600;
	global.PRICES_W[weaponID.sine_shotgun] = 650;
	global.PRICES_W[weaponID.std_cannon] = 700;	
	//B - tier
	global.PRICES_W[weaponID.super_pistol] = 850;
	global.PRICES_W[weaponID.super_shotgun] = 900;
	global.PRICES_W[weaponID.super_sniper] = 950;
	//A - tier
	global.PRICES_W[weaponID.super_ak] = 1100;
	global.PRICES_W[weaponID.super_sine] = 1250;
	global.PRICES_W[weaponID.super_cannon] = 1500;

	global.WEAPONS_AVAILABLE_AT_TIER[4] = array_length(global.PRICES_W);
	//I put this here to prevent an out-of-bounds error in the shop. 
	//C - tier
	global.PRICES_B[buildingID.block_std] = 0;
	global.PRICES_B[buildingID.block_water] = 100;
	global.PRICES_B[buildingID.tv_std] = 150;
	//B - tier
	global.PRICES_B[buildingID.turret_std] = 200;
	global.PRICES_B[buildingID.dashpad_std] = 300;
	global.PRICES_B[buildingID.healpod_std] = 200;
	//A - tier
	global.PRICES_B[buildingID.block_super] = 500;
	global.PRICES_B[buildingID.turret_super] = 500;



	global.BLDNG_PRICES[buildingID.block_std] = 25;
	global.BLDNG_PRICES[buildingID.block_water] = 50;
	global.BLDNG_PRICES[buildingID.tv_std] = 100;
	global.BLDNG_PRICES[buildingID.turret_std] = 150;
	global.BLDNG_PRICES[buildingID.dashpad_std] = 150;
	global.BLDNG_PRICES[buildingID.block_super] = 50;
	global.BLDNG_PRICES[buildingID.turret_super] = 200;
	global.BLDNG_PRICES[buildingID.healpod_std] = 100;



	//PRICES_B will be the cost to UNLOCK the block, while BLDNG_PRICES will be the cost to BUILD it

	//#macro REFUND_RATE 0.75

	//enemy populations for each wave
	global.ENEM_POP = array_create(100,0);
	global.ENEM_POP[0] = 5;
	global.ENEM_POP[1] = 8;
	global.ENEM_POP[2] = 12;
	global.ENEM_POP[3] = 15;
	for(var i = 4; i < array_length(global.ENEM_POP); i++){
		global.ENEM_POP[i] = 20;
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
}
