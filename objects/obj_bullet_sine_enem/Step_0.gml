/// @description Insert description here
// You can write your code in this editor
if(!minMaxDefined){
	currVelX = velX;
	currVelY = velY;	
	minMaxDefined = true;
}
dist = point_distance(startX,startY,x,y);
if(dist < maxDist){
	if(preTimer < preShiftTime){
		preTimer++;	
		currVelX = minVelX;
		currVelY = minVelY;
	}else{
		if(timer < shiftTime){
			timer++;
		}else{
			if(shift == -1){
				currVelX = minVelX;
				currVelY = minVelY;
				shift*= -1;
			}else{
				currVelX = maxVelX;
				currVelY = maxVelY;
				shift*= -1;
			}	
			timer = 0;
		}
	}
}else{
	instance_destroy();	
}

size = 1 + (dist/maxDist)*maxSize;
damage = def_damage + (dist/maxDist)*maxDamage;

x+= currVelX;
y+= currVelY;

