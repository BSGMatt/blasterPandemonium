/// @description Update String
// You can write your code in this editor
if(global.W_OR_B){
	myString[0] = "";
	myString[1] = "";
	switch(obj_shop_preview.position){
		case weaponID.std_pistol:
		var dps = (obj_weapon_pistol.damage*obj_weapon_pistol.pelletCount)/(obj_weapon_pistol.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_pistol.damage)+" DPS: "+string(dps);
		myString[2] = "A light pistol. It aint the best, but it's cheap.";
		break;
		
		case weaponID.std_shotgun:
		dps = (obj_weapon_shotgun.damage*obj_weapon_shotgun.pelletCount)/(obj_weapon_shotgun.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_shotgun.damage*obj_weapon_shotgun.pelletCount)+" DPS: "+string(dps);
		myString[2]  = "A shotgun with some wide pellet spread. Good against targets with large health pools and sizes.";
		break;

		case weaponID.std_sniper:
		dps = (obj_weapon_sniper.damage*obj_weapon_sniper.pelletCount)/(obj_weapon_sniper.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_sniper.damage*obj_weapon_sniper.pelletCount)+" DPS: "+string(dps);
		myString[2]  = "A sniper Rifle. Has long range and damage, but has a low fire rate.";
		break;
		
		case weaponID.std_ak:
		dps = (obj_weapon_ak.damage*obj_weapon_ak.pelletCount)/(obj_weapon_ak.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_ak.damage*obj_weapon_ak.pelletCount)+" DPS: "+string(dps);
		myString[2]  = "A gun with high fire rate with low damage per pellet.";
		break;
		
		case weaponID.std_sine:
		dps = (obj_weapon_sine.damage*obj_weapon_sine.pelletCount)/(obj_weapon_sine.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_sine.damage*obj_weapon_sine.pelletCount)+" DPS: "+string(dps);
		myString[1] = "Max Damage: "+string(obj_weapon_sine.maxDamage);
		myString[2]  = "Fires a projectile that moves in a wave-like motion. Increases in size and damage over time, but only goes a set distance.";
		break;
		
		case weaponID.std_grenade_launcher:
		dps = (obj_weapon_grenadeLauncher.damage*obj_weapon_grenadeLauncher.pelletCount)/(obj_weapon_grenadeLauncher.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_grenadeLauncher.damage*obj_weapon_grenadeLauncher.pelletCount)+" DPS: "+string(dps);
		myString[1] = "Blast Damage: "+string((obj_weapon_grenadeLauncher.blastDamage/obj_weapon_grenadeLauncher.blastDmgTick)*obj_weapon_grenadeLauncher.blastDuration);
		myString[2]  = "Launches grenades that explodes after a certain amount time, or when it hits a object, such as a solid block or enemy.";
		break;
		
		case weaponID.quirky_ak:
		dps = (obj_weapon_quirky.damage*obj_weapon_quirky.pelletCount)/(obj_weapon_quirky.fireRate/room_speed);
		myString[0] = "Damage: "+string((obj_weapon_quirky.damage*obj_weapon_quirky.pelletCount))+" DPS: "+string(dps);
		myString[1] = "Spread Range: "+string(-obj_weapon_quirky.weaponSpread)+"-"+string(obj_weapon_quirky.weaponSpread);
		myString[2] = "A automatic weapon with high damage, but random spread.";
		break;
		
		case weaponID.sine_shotgun:
		dps = (obj_weapon_sine_shotgun.damage*obj_weapon_sine_shotgun.pelletCount)/(obj_weapon_sine_shotgun.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_sine_shotgun.damage*obj_weapon_sine_shotgun.pelletCount)+" DPS: "+string(dps);
		myString[1] = "Max Damage: "+string(obj_weapon_sine_shotgun.maxDamage*obj_weapon_sine_shotgun.pelletCount);
		myString[2] = "A shotgun that fires wavy projectiles instead of regular bullets.";
		break;
		
		case weaponID.std_cannon:
		dps = (obj_weapon_cannon.damage*obj_weapon_cannon.pelletCount)/(obj_weapon_cannon.fireRate/room_speed);
		myString[0] = "Damage: "+(obj_weapon_cannon.damage*obj_weapon_cannon.pelletCount)+" DPS: "+string(dps);
		myString[2] = "A literal cannon. Has a slow fire rate, but has incredibly high damage on a chunky projectile.";
		break;
		
		case weaponID.super_pistol:
		dps = (obj_weapon_superpistol.damage*obj_weapon_superpistol.pelletCount)/(obj_weapon_superpistol.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_superpistol.damage*obj_weapon_superpistol.pelletCount)+" DPS: "+string(dps);
		myString[1] = "Blast Damage: "+string((obj_weapon_superpistol.blastDamage/obj_weapon_superpistol.blastDmgTick)*obj_weapon_superpistol.blastDuration);
		myString[2]  = "A buffed up pistol that fires grenades and wavy bullets.";
		break;
		
		case weaponID.super_shotgun:
		dps = (obj_weapon_supershotgun.damage*obj_weapon_supershotgun.pelletCount)/(obj_weapon_supershotgun.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_supershotgun.damage*obj_weapon_supershotgun.pelletCount)+" DPS: "+string(dps);
		myString[2]  = "A shotgun with more damage and more pellets. ";
		break;
		
		case weaponID.super_ak:
		dps = (obj_weapon_superak.damage*obj_weapon_superak.pelletCount)/(obj_weapon_superak.fireRate/room_speed);
		myString[0] = "Damage: "+string(obj_weapon_superak.damage*obj_weapon_superak.pelletCount)+" DPS: "+string(dps);
		myString[1] = "Blast Damage: "+string((obj_weapon_superak.blastDamage/obj_weapon_superak.blastDmgTick)*obj_weapon_superak.blastDuration);
		myString[2]  = "The Borther's big Borther. Fires tiny grenades.";
		break;
		
		default:
		myString[2]  = "This is a test string for weapons. if this isn't supposed to pop up, something's up.";
		break;
	}
}else{
		shopPos = obj_shop_preview.position;
		myString[1] = "Cost To Build: "+string(global.BLDNG_PRICES[shopPos]);
		switch(shopPos){
		case buildingID.block_std:
		myString[0] = "Max HP: "+string(obj_bGround.block_max_hp);
		myString[2] = "A Standard block. blocks enemy bullets and attacks.";
		break;
		
		case buildingID.block_water:
		myString[0] = "Speed Modifier: "+string(obj_bWater.spdMod*100)+"%";
		myString[2] = "A Slime Block. Slows down all projectiles and characters, good and bad";
		break;
		
		case buildingID.turret_std:
		myString[0] = "Max HP: "+string(obj_bTurret.block_max_hp)+",	DPS: "+string_format(obj_bTurret.wepDamage/(obj_bTurret.wepFR/room_speed),2,2);
		myString[2] = "A Turret that targets the closest enemy.";
		break;
		
		case buildingID.tv_std:
		myString[0] = "Fun Recharge Rate: "+string(obj_bTV.funRate*room_speed)+"/sec";
		myString[2] = "Recharges your 'Fun' meter. If your fun is too low, you will slow down and take more damage.";
		break;
		
		case buildingID.dashpad_std:
		myString[0] = "Speed Modifier: "+string(obj_bDashpad.spdMod*100)+"%";
		myString[2] = "A block that speeds up whatever object comes into contact.";
		break;
		
		case buildingID.turret_super:
		myString[0] = "Max HP: "+string(obj_bTurretSuper.block_max_hp)+",	DPS: "+string_format(obj_bTurretSuper.wepDamage/(obj_bTurret.wepFR/room_speed),2,2);
		myString[2] = "A buffed up turret. Can detect enemies from farther away and does more damage.";
		break;
		
		case buildingID.block_super:
		myString[0] = "Max HP: "+string(obj_bGroundSuper.block_max_hp);
		myString[2] = "A stronger block with more HP.";
		break;
		
		case buildingID.healpod_std:
		myString[0] = "Healing Rate: "+string(obj_bHealpod.healRate*room_speed)+"/sec";
		myString[2] = "This block will heal you up if you stand near it.";
		break;
		
		default:
		myString[2] = "This is a test string for blocks. if this isn't supposed to pop up, something's up.";
		break;
	}
}