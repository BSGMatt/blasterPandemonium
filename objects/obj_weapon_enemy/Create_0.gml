/// @description - Init Variables
// You can write your code in this editor
damage = 0;
ammo = 0;//The amount ammo the enemy currently has. 
ammoK = 0;//The max ammo the enemy will have. 
fireRate = 0;//How fast the weapon fires. 
pelletVelocity = 20;//The Velocity at which a weapon's pellets travels. 
spread = 0;//How far, in degrees, will a pellet deviate from the weapon's actual direction. 
pelletCount = 3;//How many pellets fired per shot. 
timer = 0;//Timer variable; used for firing. 
reloadTimer = 0;//Timer variable; used for reloading. 
reloadRate = room_speed;//How long it takes for a weapon to reload. 
reloading = false;
name = "";
wep_emit = audio_emitter_create();
blastDamage = 0;//How much damage is dealt every instance
blastDmgTick = 0;//How many frames an instance of damage is dealt. 
blastDuration = 0;//How long in frames the explosion will last. 
blastRadius = 0;//The size of the explosion. This is a multiplier, where a radius of 1 is 32 pixels, 2 is 64, etc. 
hasExplosive = false;
pelletLifeTime = -1;

switch(type){
	case weaponType.manual:
	ammo = MAX_AMMO_MAN;
	ammoK = MAX_AMMO_MAN;
	break;
	case weaponType.semi:
	ammo = MAX_AMMO_SEMI;
	ammoK = MAX_AMMO_SEMI;
	break;
	case weaponType.auto:
	ammo = MAX_AMMO_AUTO;
	ammoK = MAX_AMMO_AUTO;
	break;
	default:
	ammo = MAX_AMMO_SEMI;
	ammoK = MAX_AMMO_SEMI;
	break;	
}

