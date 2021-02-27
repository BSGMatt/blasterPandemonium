//@description rounds a number to the nearest digit.
//@param value of the number
//@param digit the nearest digit to round to. 
//@precondition the value of digit will be positive.  

function round_to_digit(value, digit){
	if(digit == 0) return value;
	
	var decimal = round((value - floor(value)) * power(10, digit));
 
	decimal /= power(10, digit);
	
	return floor(value) + decimal;
}

function get_decimal(value){
	return value - floor(value);	
}