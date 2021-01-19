/// @description Insert description here
// You can write your code in this editor
//color of the image will change from white (normal way) to red as block will take more damage
//COLLISION
if(isDestructible){
	var bullet = instance_place(x,y,obj_bullet_enemy);
	if(bullet != noone){
			hp -= bullet.damage;	
			instance_destroy(bullet);
			percent = hp/block_max_hp;
			//SMOOTH FADE TO RED
			colorVal = $0000FF;
			var n = percent * 16;
			n = floor(n);
			for(var i=0; i < n; i++) colorVal = colorVal + $111100;

	}
	var blast = instance_place(x,y,obj_blast);
	if(blast != noone){
			hp -= blast.damage;	
			percent = hp/block_max_hp;
			//SMOOTH FADE TO RED
			colorVal = $0000FF;
			var n = percent * 16;
			n = floor(n);
			for(var i=0; i < n; i++) colorVal = colorVal + $111100;
	}
}
if (hp <= 0) {
	if(instance_exists(myWeapon)) instance_destroy(myWeapon);
	instance_destroy();
}