/// @description Draw Sprites
// You can write your code in this editor
if(global.BUILDER_EN){
	image_alpha = 0.5;
	sprite_index = spr_builder_crosshair;
	switch(global.INV_BLOCK[slotPos]){
		case buildingID.block_water:
			blockSprite = object_get_sprite(obj_bWater);
		break;
					
		case buildingID.turret_std:
			blockSprite = object_get_sprite(obj_bTurret);
		break;
					
		case buildingID.dashpad_std:
			blockSprite = object_get_sprite(obj_bDashpad);
		break;
		
		case buildingID.block_super:
			blockSprite = object_get_sprite(obj_bGroundSuper);
		break;
					
		case buildingID.turret_super:
			blockSprite = object_get_sprite(obj_bTurretSuper);
		break;
					
		case buildingID.tv_std:
			blockSprite = object_get_sprite(obj_bTV);
		break;
					
		case buildingID.healpod_std:
			blockSprite = object_get_sprite(obj_bHealpod);
		break;		
					
		default:
			blockSprite = object_get_sprite(obj_block);
		break;
	}
	draw_sprite_ext(blockSprite,0,x,y,image_xscale,image_yscale,0,c_white,image_alpha);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,image_alpha);
}
	draw_set_color(c_black);
//draw_text(x,y,string(IDstring));