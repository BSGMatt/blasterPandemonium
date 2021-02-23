/// @description Draws the GUI
// You can write your code in this editor
marginX = 40;
marginY = 0;
barHeight = 24;
barWidth = 300;
barHealthSegment = 25;
barXPSegment = 250;
viewX = view_get_xport(0);
viewY = view_get_yport(0);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(Font_HUD);
if(room == room_main){
	if(global.WAVE_PHASE < 0){
		draw_set_halign(fa_left);
		draw_text(viewX,viewY,"PRESS ENTER TO START WAVE");
	}else if(global.PLAYER_DIED){
		draw_text(viewX,viewY,"RESPAWNING IN: "+string_format(respawnTimer/room_speed,2,1));
	}else{
		if(instance_exists(obj_player)){
			draw_set_halign(fa_left);
			/// Player Healthbar/////////////////
			numOfHealthSegments = global.plyMaxHP/barHealthSegment;
			numOfHealthSegments = floor(numOfHealthSegments);
			healthSegmentLength = (barWidth/numOfHealthSegments);
			healthSegmentLength = floor(healthSegmentLength);
			HealthSegmentremainder = global.plyMaxHP mod barHealthSegment;
			//Draw Background Health
			marginY+=barHeight;
			var iconW = sprite_get_height(spr_hud_icon_funbar);
			draw_sprite(spr_hud_icon_healthbar,0,viewX-iconW+marginX,viewY+marginY);
			//Draw healtbar
			draw_healthbar(viewX+marginX,(viewY+marginY),
			(viewX+marginX)+numOfHealthSegments+(healthSegmentLength*(numOfHealthSegments+(HealthSegmentremainder/barHealthSegment))),
			(viewY+marginY)+barHeight,(global.plyHP/global.plyMaxHP)*100,c_black,c_red,c_green,0,true,true);
			//
			//Add Healthbar "Segments" (Think Overwatch health pools)
			draw_set_color(c_white);
			for(var i = 1; i <= numOfHealthSegments; i++){				
				//Adjust length of each segment to account values not divisible by 25
				draw_rectangle(viewX+marginX,(viewY+marginY),(viewX+marginX)+healthSegmentLength,(viewY+marginY)+barHeight,true);
				marginX += healthSegmentLength+1;
			}
			if(HealthSegmentremainder > 0){
				var leftover = healthSegmentLength * (HealthSegmentremainder / barHealthSegment);
				draw_rectangle(viewX+marginX, (viewY+marginY), (viewX+marginX) + leftover,(viewY+marginY)+barHeight,true);
				marginX += leftover+1;
			}
			/// XP ///
			marginX = 40;
			marginY += barHeight+4;
			
			numOfXPSegments = global.xpThreshold[global.plyLevel]/barXPSegment;	
			numOfXPSegments = floor(numOfXPSegments);			
			XPsegmentLength = barWidth/numOfXPSegments;
			XPsegmentLength = floor(XPsegmentLength);
			XPremainder = global.xpThreshold[global.plyLevel] mod barXPSegment;
			var indent = 0;
			draw_sprite(spr_hud_icon_xpbar,0,viewX-iconW+marginX,viewY+marginY);
			draw_healthbar(viewX+marginX,viewY+marginY,
			(viewX+marginX)+numOfXPSegments+(XPsegmentLength*(numOfXPSegments+(XPremainder/barXPSegment))),
			(viewY+marginY)+barHeight,(global.xp/global.xpThreshold[global.plyLevel])*100,
			c_black,c_teal,c_teal,0,true,true);
			draw_set_color(c_white);
			for(var i = 1; i <= numOfXPSegments; i++){
				draw_rectangle(viewX+marginX,(viewY+marginY),(viewX+marginX)+XPsegmentLength+indent,(viewY+marginY)+barHeight,true);
				marginX += XPsegmentLength+indent+1;
			}
			if(XPremainder > 0){
				var leftover = XPsegmentLength*(XPremainder/barXPSegment);
				draw_rectangle(viewX+marginX,(viewY+marginY),(viewX+marginX)+leftover,(viewY+marginY)+barHeight,true);
				marginX += leftover+1;
			}
			/// FUN Meter ///
			marginX = 40;
			marginY += barHeight+4;
			
			numFunSegments = global.MAX_FUN/barHealthSegment;	
			numFunSegments = floor(numFunSegments);			
			funSegLength = barWidth/numFunSegments;
			funSegLength = floor(funSegLength);
			funRemainder = global.MAX_FUN mod barHealthSegment;
			indent = 0;
			draw_sprite(spr_hud_icon_funbar,0,viewX-iconW+marginX,viewY+marginY);
			draw_healthbar(viewX+marginX,viewY+marginY,
			(viewX+marginX)+numFunSegments+(funSegLength*(numFunSegments+(funRemainder/barHealthSegment))),
			(viewY+marginY)+barHeight,(global.FUN/global.MAX_FUN)*100,
			c_black,c_purple,c_yellow,0,true,true);
			draw_set_color(c_black);
			for(var i = 1; i <= numFunSegments; i++){
				draw_rectangle(viewX+marginX,(viewY+marginY),(viewX+marginX)+funSegLength+indent,(viewY+marginY)+barHeight,true);
				marginX += funSegLength+indent+1;
			}
			if(funRemainder > 0){
				var leftover = funSegLength*(funRemainder/barHealthSegment);
				draw_rectangle(viewX+marginX,(viewY+marginY),(viewX+marginX)+leftover,(viewY+marginY)+barHeight,true);
				marginX += leftover+1;
			}
			/////////////////
			///WAVE//////////			
			draw_set_halign(fa_center);
			marginX=viewX + view_get_wport(0)/2;
			marginY = 0;
			draw_text(marginX,marginY,"Wave: "+string(global.WAVE + 1));
			///////////
			///CASH///////
			cashString = "$"+string(global.CURRENCY);
			marginX = view_get_wport(0) - (string_width(cashString)+40);
			marginY = view_get_hport(0) - 40;
			cashBoxHeight = string_height(cashString)-10;
			cashBoxWidth = string_width(cashString);
			draw_rectangle_color(marginX,marginY,marginX+cashBoxWidth,marginY+cashBoxHeight,c_green,c_green,c_green,c_green,false);
			draw_set_halign(fa_left);
			draw_set_color(c_black);
			draw_text(marginX,marginY,cashString);
			////////////////////
			///LEVEL INFO///////
			levelString = "LEVEL: "+string(global.plyLevel)+", TIER: "+string(global.PLAYER_TIER);
			marginX = view_get_wport(0) - (string_width(levelString)+40);
			marginY = 40;
			levelBoxHeight = string_height(levelString)-10;
			levelBoxWidth = string_width(levelString);
			draw_rectangle_color(marginX,marginY,marginX+levelBoxWidth,marginY+levelBoxHeight,c_blue,c_blue,c_blue,c_blue,false);
			draw_set_halign(fa_left);
			draw_set_color(c_black);
			draw_text(marginX,marginY,levelString);
			//Draw Phase///////////////////////
			draw_set_color($0000AA);//DARKER SHADE OF RED
			switch(global.WAVE_PHASE){					
				case Phase.SWARM:
				draw_set_halign(fa_center);
				draw_text(viewX+view_get_wport(0)/2,viewY+string_height("A")+4,"Enemies: "+string(global.currentEnemyKills)+"/"+string(global.ENEM_POP[global.WAVE]));
				draw_set_color(c_black);
				draw_text(viewX+view_get_wport(0)/2,viewY+(string_height("A")*2)+4,scr_change_hud_content());
				break;
				
				default:
				draw_set_halign(fa_center);
				draw_text_ext(viewX+view_get_wport(0)/2,viewY+string_height("A")+4,scr_change_hud_content(),string_height("A")+4,string_width("AAAAAAAAAAAAAAA"));
				break;		
			}
		}
	}
}else if(room == rm_shop){
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(viewX+marginX,viewY,"Cash: "+string(global.CURRENCY));
	marginX += 300;
	if(global.W_OR_B)
		draw_text(viewX+marginX,viewY,"PRICE: "+string(global.PRICES_W[obj_shop_preview.position]));
	else
		draw_text(viewX+marginX,viewY,"PRICE: "+string(global.PRICES_B[obj_shop_preview.position]));
}


if(gamePause == true){
	marginX = 40;
	draw_text(viewX+marginX,viewY+marginY,"PAUSED");
}