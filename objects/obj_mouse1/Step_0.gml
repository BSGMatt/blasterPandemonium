/// @description Main
// You can write your code in this editor
x = mouse_x;
y = mouse_y;
depth = -1000;//Make sure mouse is on top of everything
//Interactions
//shop button

//shop arrows
var arrow = instance_place(x,y,obj_shop_arrow);
if(arrow != noone){
	if(mouse_check_button_pressed(mb_left)){
		audio_play_sound(sfx_select,2,false);
		if(global.W_OR_B){
			if(arrow.selection_dir < 0){
				if(obj_shop_preview.position-1 < 0){
					obj_shop_preview.position = 0;	
				}else{
					obj_shop_preview.position += arrow.selection_dir;
				}
			}else{
				if(obj_shop_preview.position+1 >= global.WEAPONS_AVAILABLE_AT_TIER[global.PLAYER_TIER]){
					obj_shop_preview.position = 0;	
				}else{
					obj_shop_preview.position += arrow.selection_dir;
				}
			}
		}else{
			if(arrow.selection_dir < 0){
				if(obj_shop_preview.position-1 < 0){
					obj_shop_preview.position = 0;	
				}else{
					obj_shop_preview.position += arrow.selection_dir;
				}
			}else{
				if(obj_shop_preview.position+1 >=  global.BLOCKS_AVAILABLE_AT_TIER[global.PLAYER_TIER]){
					obj_shop_preview.position = 0;	
				}else{
					obj_shop_preview.position += arrow.selection_dir;
				}
			}
		}
		arrow = noone;
	}
}

if(place_meeting(x,y,obj_shop_swap)){
	if(mouse_check_button_pressed(mb_left)){
		var layerID = layer_get_id("Background");
		if(!global.W_OR_B) {
			global.W_OR_B = true;
			layer_background_sprite(layer_background_get_id(layerID),spr_bg_weaponModeShop);
		}else{
			global.W_OR_B = false;
			layer_background_sprite(layer_background_get_id(layerID),spr_bg_blockModeShop);
		}
		obj_shop_preview.position = 0;
	}
}

//shop preview button
if(place_meeting(x,y,obj_shop_preview)){
	if(mouse_check_button_pressed(mb_left)){
		thisID = obj_shop_preview.position;
		if(global.W_OR_B){
			if(global.IFP_WEAPON[thisID] == false && global.CURRENCY >= global.PRICES_W[thisID]){
				global.CURRENCY -= global.PRICES_W[thisID];		
				global.IFP_WEAPON[thisID] = true;
				global.INV_WEAPON[global.NSA_WEAPON] = thisID;
				global.NSA_WEAPON++;
			}
		}else{
			if(global.IFP_BLOCK[thisID] == false && global.CURRENCY >= global.PRICES_B[thisID]){
				global.CURRENCY -= global.PRICES_B[thisID];		
				global.IFP_BLOCK[thisID] = true;
				global.INV_BLOCK[global.NSA_BLOCK] = thisID;
				global.NSA_BLOCK++;
			}
		}
		audio_play_sound(sfx_confirm,2,false);
	}
}

if(place_meeting(x,y,obj_menu_start)){
	if(mouse_check_button_pressed(mb_left)){
		global.LOAD_GAME = false;
		room_goto(rm_cutscene);
	}
}


if(place_meeting(x,y,obj_menu_tutorial)){
	if(mouse_check_button_pressed(mb_left)){
		global.LOAD_GAME = true;
		room_goto(room_main);
	}
}

if(place_meeting(x,y,obj_menu_quit)){
	if(mouse_check_button_pressed(mb_left)){
		game_end();
	}
}

