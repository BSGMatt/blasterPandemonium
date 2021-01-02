/// @description Insert description here
// You can write your code in this editor
switch(option){
	default:
		myString = "";
	break;
	
	case optionHovering.NEW:
		myString = "Start a game from the beginning. NOTE: This will delete your existing save file.";
	break;
	
	case optionHovering.LOAD:
		myString = "Load the game from your last save.";
	break;
	
	case optionHovering.QUIT:
		myString = "Close the game and go back to the desktop.";
	break;
}