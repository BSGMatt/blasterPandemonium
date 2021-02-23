/// @description Draw preview sprites
// You can write your code in this editor

//NEW CODE
objID = noone;
arr = global.IFP_WEAPON;//Variable to choose which array to reference
if(global.W_OR_B){
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_bg_weaponModeShop);
	switch(position){
		case weaponID.std_pistol:
			objID = obj_weapon_pistol;
		break;
		
		case weaponID.std_sniper:
			objID = obj_weapon_sniper;
		break;	
		
		case weaponID.std_shotgun:
			objID = obj_weapon_shotgun;
		break;

		case weaponID.std_ak:
			objID = obj_weapon_ak;
		break;
		
		case weaponID.std_sine:
			objID = obj_weapon_sine;
		break;

		case weaponID.std_grenade_launcher:
			objID = obj_weapon_grenadeLauncher;
		break;
		
		case weaponID.quirky_ak:
			objID = obj_weapon_quirky;
		break;
		
		case weaponID.sine_shotgun:
			objID = obj_weapon_sine_shotgun;
		break;
		
		case weaponID.std_cannon:
			objID = obj_weapon_cannon;
		break;
		
		case weaponID.super_pistol:
			objID = obj_weapon_superpistol;
		break;
		
		case weaponID.super_shotgun:
			objID = obj_weapon_supershotgun;
		break;
		
		case weaponID.super_ak:
			objID = obj_weapon_superak;
		break;
		
		case weaponID.std_flamethrower:
			objID = obj_weapon_flamethrower;
		break; 
		
		default:
			objID = obj_shop_preview;
		break;
	}
}else{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_bg_blockModeShop);
	arr = global.IFP_BLOCK;
	switch(position){
		case buildingID.dashpad_std:
			objID = obj_bDashpad;
		break;
		case buildingID.block_std:
			objID = obj_bGround;
		break;
		case buildingID.block_water:
			objID = obj_bWater;
		break;
		case buildingID.turret_std:
			objID = obj_bTurret;
		break;
		case buildingID.turret_super:
			objID = obj_bTurretSuper;
		break;
		case buildingID.block_super:
			objID = obj_bGroundSuper;
		break;
		case buildingID.tv_std:
			objID = obj_bTV;
		break;
		case buildingID.healpod_std:
			objID = obj_bHealpod;
		break;
		
		default:
			objID = obj_shop_preview;
		break;
	}
}

//DISPLAY ITEM:
draw_sprite_ext(object_get_sprite(objID),0,x,y,2,2,0,c_white,image_alpha);
if(arr[position] = true){
	draw_sprite(spr_shop_sold,0,x,y);	
}


/*OLD CODE
if(global.W_OR_B){
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_bg_weaponModeShop);
	objID = noone;
	
	//Select which object to grab a sprite from. 
	switch(position){
		case weaponID.std_pistol:
			objID = obj_weapon_pistol;
		break;
		
		case weaponID.std_sniper:
			objID = obj_weapon_sniper;
		break;	
		
		case weaponID.std_shotgun:
			objID = obj_weapon_shotgun;
		break;

		case weaponID.std_ak:
			objID = obj_weapon_ak;
		break;
		
		case weaponID.std_sine:
			objID = obj_weapon_sine;
		break;

		case weaponID.std_grenade_launcher:
			objID = obj_weapon_grenadeLauncher;
		break;
		
		case weaponID.quirky_ak:
			objID = obj_weapon_quirky;
		break;
		
		case weaponID.sine_shotgun:
			objID = obj_weapon_sine_shotgun;
		break;
		
		case weaponID.std_cannon:
			objID = obj_weapon_cannon;
		break;
		
		case weaponID.super_pistol:
			objID = obj_weapon_superpistol;
		break;
		
		case weaponID.super_shotgun:
			objID = obj_weapon_supershotgun;
		break;
		
		case weaponID.super_ak:
			objID = obj_weapon_superak;
		break;
		
		case weaponID.std_flamethrower:
			objID = obj_weapon_flamethrower;
		break; 
		
		default:
			objID = obj_shop_preview;
		break;
	}
	//DRAW WEAPON
	draw_sprite_ext(object_get_sprite(objID),0,x,y,2,2,0,c_white,image_alpha);
	
	
	if(global.IFP_WEAPON[position] = true){
		draw_sprite(spr_shop_sold,0,x,y);	
	}
}else{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_bg_blockModeShop);
	
	//Select which object to grab a sprite from. 
	objID = noone;
	switch(position){
		case buildingID.dashpad_std:
			objID = obj_bDashpad;
		break;
		case buildingID.block_std:
			objID = obj_bGround;
		break;
		case buildingID.block_water:
			objID = obj_bWater;
		break;
		case buildingID.turret_std:
			objID = obj_bTurret;
		break;
		case buildingID.turret_super:
			objID = obj_bTurretSuper;
		break;
		case buildingID.block_super:
			objID = obj_bGroundSuper;
		break;
		case buildingID.tv_std:
			objID = obj_bTV;
		break;
		case buildingID.healpod_std:
			objID = obj_bHealpod;
		break;
		
		default:
			objID = obj_shop_preview;
		break;
	}
	//DRAW BLOCK
	draw_sprite_ext(object_get_sprite(objID),0,x,y,2,2,0,c_white,image_alpha);
	
	
	if(global.IFP_BLOCK[position] = true){
		draw_sprite(spr_shop_sold,0,x,y);	
	}
}*/


