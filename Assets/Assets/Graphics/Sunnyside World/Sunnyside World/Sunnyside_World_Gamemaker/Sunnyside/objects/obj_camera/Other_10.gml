///@desc METHODS

isZooming = function()
{
	return ( tick < timer )	
}

SetCameraZoom = function (_scale,_time)
{
	factor = 1/_scale;	
	widthFrom = widthCur;
	widthTo = width*factor;
	heightFrom = heightCur;
	heightTo = height*factor;
	
	tick = 0;
	timer = _time;
}

SetCameraTarget = function(_instID)
{
	target = _instID;	
}