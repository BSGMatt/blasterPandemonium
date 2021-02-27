// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function interpolate_speed(){
	if(get_decimal(normalSpeed) > 0 && !interpolationActive) {
		mSpeed = floor(normalSpeed);
		interpolationTimer = INTERPOLATION_TIME;
		interpolationActive = true;
	}else if(get_decimal(normalSpeed) == 0){
		mSpeed = normalSpeed;	
	}

	if(interpolationActive){
		if(interpolationTimer > 0) {
			interpolationTimer--;	
		}
		if(interpolationTimer <= 0){
			mSpeed += get_decimal(normalSpeed) * INTERPOLATION_TIME; 
		}
	}
}