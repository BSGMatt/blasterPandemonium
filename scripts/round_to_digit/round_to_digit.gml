//@description rounds a number to the nearest digit.
//@param value of the number
//@param digit the nearest digit to round to. 
//@precondition the absolute value of digit is used, so -2 would just be 2. 

function round_to_digit(value, digit){
	if(digit < 0) digit *= -1;
	if(digit == 0) return value;
	
	var decimal = value - floor(value);
	
	decimal *= power(10, digit);
	round(decimal);
	decimal /= power(10, digit);
	
	return floor(value) + decimal;
}