///This script declares all global variables. 
function scr_univar() {
	//INIT
	randomise();
	global.plyLevel = 0;
	global.PLAYER_TIER = 0;
	global.plyHP = 200;
	global.plyMaxHP = 200;
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
		break;
	}


	for(var i = 0; i < 50; i++){
		global.xpThreshold[i] = round(global.xpThreshold[0]*exp(0.152*i));
	}

	global.WAVE = 0;
	global.WAVE_PHASE = Phase.IDLE;
	global.TIMER = PREP_TIME;//60 seconds
	global.WAVE_STARTED = false;
	//0 = prep phase, 1 = attack phase, boss phase;

	//inventory and buying
	global.CURRENCY  = 750;

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
	global.IFP_WEAPON = array_create(15, false);//IFP stands for "Items For Purchase";
	global.IFP_BLOCK = array_create(15, false);//IFP stands for "Items For Purchase";
	global.PRICES_W = array_create(15, 100);
	global.PRICES_B = array_create(15, 100);

	global.W_OR_B = false;//W=true,B=false
	global.NSA_WEAPON = 0;//STANDS FOR "NEXT SLOT AVAILABLE";
	global.NSA_BLOCK = 0;
	global.INV_WEAPON[global.NSA_WEAPON] = -1;
	global.INV_BLOCK[global.NSA_BLOCK] = -1;


	//set prices for items
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
