/// @description - Init Variables
// You can write your code in this editor
pelletType = obj_bullet_friendly;
damage = 0;
minDamage = 0;
maxDamage = 0;
ammo = 0;
ammoK = 0;
fireRate = 0;
pelletVelocity = 30;
spread = 0;
pelletCount = 3;
timer = 0;
reloadTimer = 0;
reloadRate = room_speed;
reloading = false;
nickname = "";
delay = 0;
wep_emit = audio_emitter_create();
blastDamage = 0;
blastDmgTick = 0;
blastDuration = 0;
blastRadius = 0;
pelletVelocity = 20;
hasExplosive = false;
mySound = sfx_blaster;
shaking = false;
shakeAngle = 0;
shakeTimer = 0;
dev = 0;
effect = CharacterEffect.NORMAL;
effectValue = 1;


pelletLifeTime = -1;//-1 denotes infinite lifetime

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

