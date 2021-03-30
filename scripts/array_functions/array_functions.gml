// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_contains(array, key){
	
	//iterate through array
	for (var i = 0; i < array_length(array); i++) {
		var j = array_get(array, i);
		if (j == key) {
			return true;	
		}
	}
	
	return false;
}