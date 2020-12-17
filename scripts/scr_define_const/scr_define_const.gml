function scr_define_const() {
	audio_stop_all();
#macro MAX_CRYSTAL_HP 500
#macro MAX_FUN 120
#macro STARTING_FUN 50
#macro FUN_TICK_RATE .030//RATE OF FUN OVER TIME
#macro CRYSTAL_HPS 10
#macro PREP_TIME room_speed*180
#macro REFUND_RATE 0.75
#macro MAX_AMMO_MAN 10
#macro MAX_AMMO_SEMI 25
#macro MAX_AMMO_AUTO 50

	//PHASE ENUM
	enum Phase{
		IDLE = -1,
		PREP = 0,
		SWARM = 1,
		BOSS = 2
	}

	//WEAPON ENUM
	enum weaponID{
		std_pistol = 0,
		std_shotgun = 1,
		std_sniper = 2,
		std_ak = 3,
		std_sine = 4,
		std_grenade_launcher = 5,
		quirky_ak = 6,
		sine_shotgun = 7,
		std_cannon = 8,
		super_pistol = 9,
		super_shotgun = 10,
		super_sniper = 11,
		super_ak = 12,	
		super_sine = 13,
		super_cannon = 14
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
	}



	//Music Enum
	enum Music{
		MENU = 0,
		PREP = 1,
		SWARM = 2,
		BOSS = 3,
		VICTORY = 4,
		GAME_OVER = 5
	}





}
