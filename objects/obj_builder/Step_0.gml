/// @description Insert description here-
// You can write your code in this editor
if(global.BUILDER_EN){
	x = obj_mouse.x;
	y = obj_mouse.y;
	move_snap(GRID,GRID);
	
		//Sroll through invetory slot
	if(array_length(global.INV_BLOCK) > 1){
		if(keyboard_check_pressed(ord("Q"))){
			//
			if(slotPos > 0) slotPos--;
			switched = true;
		}else if(keyboard_check_pressed(ord("E"))){
			//
			if(slotPos < array_length(global.INV_BLOCK)-1) slotPos++;
			switched = true;
		}else{
			switched = false;	
		}
	}

	//SWAPPING ITEMS
	
	var block;
	var select;
	if(mouse_check_button_pressed(mb_left)){
		if(!position_meeting(x,y,obj_block)){			
			if(global.CURRENCY >= global.BLDNG_PRICES[global.INV_BLOCK[slotPos]]){		
				global.CURRENCY -= global.BLDNG_PRICES[global.INV_BLOCK[slotPos]];
				switch(global.INV_BLOCK[slotPos]){
					case buildingID.block_water:
						block = instance_create_layer(x,y,"instance_layer",obj_bWater);
					break;
					
					case buildingID.turret_std:
						block = instance_create_layer(x,y,"instance_layer",obj_bTurret);
					break;
					
					case buildingID.dashpad_std:
						block = instance_create_layer(x,y,"instance_layer",obj_bDashpad);
					break;
					
					case buildingID.block_super:
						block = instance_create_layer(x,y,"instance_layer",obj_bGroundSuper);
					break;
					
					case buildingID.turret_super:
						block = instance_create_layer(x,y,"instance_layer",obj_bTurretSuper);
					break;
					
					case buildingID.tv_std:
						block = instance_create_layer(x,y,"instance_layer",obj_bTV);
					break;
					
					case buildingID.healpod_std:
						block = instance_create_layer(x,y,"instance_layer",obj_bHealpod);
					break;
					
					default:
						block = instance_create_layer(x,y,"instance_layer",obj_bGround);
					break;
				}
				block.blockID = global.INV_BLOCK[slotPos];
				block.fromBuilder = true;
			}
			
			block = noone;
			audio_play_sound(sfx_block_create,50,false);
		}
	}else if(mouse_check_button_pressed(mb_right)){
		select = instance_place(x,y,obj_block);
		if(select != noone && select.fromBuilder = true){
			var refund = round(global.BLDNG_PRICES[select.blockID]*REFUND_RATE);
			global.CURRENCY += refund;
			audio_play_sound(sfx_block_destroy,50,false);
			if(variable_instance_exists(select,"block_emit")) audio_emitter_free(select.block_emit);
			if(variable_instance_exists(select,"myWeapon")) instance_destroy(select.myWeapon);
			instance_destroy(select);
		}
	}

}