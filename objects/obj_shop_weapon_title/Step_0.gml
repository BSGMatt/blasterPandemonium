/// @description Update String
// You can write your code in this editor
if(global.W_OR_B){
	switch(obj_shop_preview.position){
		case weaponID.std_pistol:
		myString = "THE \"PEW\"";
		break;
		
		case weaponID.std_shotgun:
		myString = "THE \"CHUCK\"";
		break;

		case weaponID.std_sniper:
		myString = "THE \"FRANCO\"";
		break;
		
		case weaponID.std_ak:
		myString = "THE \"BORTHER\"";
		break;
		
		case weaponID.std_sine:
		myString = "THE \"WAVE\"";
		break;
		
		case weaponID.std_grenade_launcher:
		myString = "THE \"BOMB\"";
		break;
		
		case weaponID.super_pistol:
		myString = "THE \"ULTRA-PEW\"";
		break;
		
		case weaponID.super_shotgun:
		myString = "THE \"ULTRA-CHUCK\"";
		break;
		
		case weaponID.super_ak:
		myString = "THE \"ULTRA-BORTHER\"";
		break;
		
		default:
		myString = "THE \"GENERIC WEAPON\"";
		break;
	}
}else{
		switch(obj_shop_preview.position){
		case buildingID.block_std:
		myString = "BLOCK";
		break;
		
		case buildingID.block_water:
		myString = "SLIME";
		break;
		
		case buildingID.turret_std:
		myString = "TURRET";
		break;
		
		case buildingID.block_super:
		myString = "BRICK WALL";
		break;
		
		case buildingID.dashpad_std:
		myString = "DASHPAD";
		break;
		
		case buildingID.turret_super:
		myString = "HEAVY TURRET";
		break;
		
		case buildingID.tv_std:
		myString = "TV";
		break;
		
		case buildingID.healpod_std:
		myString = "HEAL POD";
		break;
		
		default:
		myString = "GENERAL NAME FOR A BLOCK";
		break;
	}
}