/// @description This script will reformat the given to minutes:seconds. 
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_clock_format(time){
var mins = 0;
var secs = 0;

//Get mins
mins = floor(time/60);

//Get secs
secs = floor(time % 60);

var secString = string(secs);
if(secs < 10) secString = "0" + string(secs);

//Return string
return(string(mins)+":"+secString);

}