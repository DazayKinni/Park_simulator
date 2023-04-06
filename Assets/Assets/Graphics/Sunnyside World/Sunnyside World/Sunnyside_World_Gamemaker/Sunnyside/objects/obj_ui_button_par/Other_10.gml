/// @desc METHODS

SetScript = function(_scriptOnPress)
{
	scriptOnPress = _scriptOnPress;
}	


SetDelay = function(_delay)	//sets a delay for the build-out animation
{
	transform.Reinitialize(_delay);
}

SetCoords = function()	//updates button press coordinates
{
	x1 = x - (boxW/2);
	x2 = x1 + boxW;
	y1 = y - (boxH/2);
	y2 = y1 + boxH;
}

SetBlend = function(_pillcol,_contentCol)
{
	pillCol = _pillcol;
	contentCol = _contentCol;
}

SetSound = function(_sound)
{
	mySound = _sound;	
}