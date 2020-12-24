/// @description Draw preview sprites
// You can write your code in this editor
if(global.W_OR_B){
	//draw_sprite(spr_shop_preview_weapon,position,x,y);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_bg_weaponModeShop);
	switch(position){
		case weaponID.std_pistol:
			draw_sprite_ext(object_get_sprite(obj_weapon_pistol),0,x,y,2,2,0,c_white,image_alpha);
		break;
		
		case weaponID.std_sniper:
			draw_sprite_ext(object_get_sprite(obj_weapon_sniper),0,x,y,2,2,0,c_white,image_alpha);
		break;	
		
		case weaponID.std_shotgun:
			draw_sprite_ext(object_get_sprite(obj_weapon_shotgun),0,x,y,2,2,0,c_white,image_alpha);
		break;

		case weaponID.std_ak:
			draw_sprite_ext(object_get_sprite(obj_weapon_ak),0,x,y,2,2,0,c_white,image_alpha);
		break;
		
		case weaponID.std_sine:
			draw_sprite_ext(object_get_sprite(obj_weapon_sine),0,x,y,2,2,0,c_white,image_alpha);
		break;

		case weaponID.std_grenade_launcher:
			draw_sprite_ext(object_get_sprite(obj_weapon_grenadeLauncher),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		case weaponID.quirky_ak:
			draw_sprite_ext(object_get_sprite(obj_weapon_quirky),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		case weaponID.sine_shotgun:
			draw_sprite_ext(object_get_sprite(obj_weapon_sine_shotgun),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		case weaponID.std_cannon:
			draw_sprite_ext(object_get_sprite(obj_weapon_cannon),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		case weaponID.super_pistol:
			draw_sprite_ext(object_get_sprite(obj_weapon_superpistol),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		case weaponID.super_shotgun:
			draw_sprite_ext(object_get_sprite(obj_weapon_supershotgun),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		case weaponID.super_ak:
			draw_sprite_ext(object_get_sprite(obj_weapon_superak),0,x,y,2,2,0,c_white,image_alpha);;
		break;
		
		default:
			draw_sprite(spr_shop_preview_weapon,position,x,y);
		break;
	}
	if(global.IFP_WEAPON[position] = true){
		draw_sprite(spr_shop_sold,0,x,y);	
	}
}else{
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")),spr_bg_blockModeShop);
	switch(position){
		case buildingID.dashpad_std:
			draw_sprite_ext(object_get_sprite(obj_bDashpad),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.block_std:
			draw_sprite_ext(object_get_sprite(obj_bGround),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.block_water:
			draw_sprite_ext(object_get_sprite(obj_bWater),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.turret_std:
			draw_sprite_ext(object_get_sprite(obj_bTurret),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.turret_super:
			draw_sprite_ext(object_get_sprite(obj_bTurretSuper),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.block_super:
			draw_sprite_ext(object_get_sprite(obj_bGroundSuper),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.tv_std:
			draw_sprite_ext(object_get_sprite(obj_bTV),0,x,y,2,2,0,c_white,image_alpha);
		break;
		case buildingID.healpod_std:
			draw_sprite_ext(object_get_sprite(obj_bHealpod),0,x,y,2,2,0,c_white,image_alpha);
		break;
		
		default:
		draw_sprite(spr_shop_preview_block,position,x,y);
		break;
	}
	if(global.IFP_BLOCK[position] = true){
		draw_sprite(spr_shop_sold,0,x,y);	
	}
}
