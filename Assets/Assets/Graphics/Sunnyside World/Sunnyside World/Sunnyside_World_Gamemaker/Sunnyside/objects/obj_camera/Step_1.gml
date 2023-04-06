///@desc ZOOM

if keyboard_check_pressed(vk_anykey) 
{
	Trace ( keyboard_lastkey );
}

var _zoom = keyboard_check_pressed(24) - keyboard_check_pressed(109)
if _zoom != 0 
{
	zoomCur += _zoom*.2
	zoomCur = clamp(zoomCur,0.2,1);
	SetCameraZoom(zoomCur,30);
}

if ( tick < timer )
{
	tick++;
	var _t = tick/timer;
	widthCur = BezierCache( widthFrom, widthTo, _t, 0, 0, .5, 1 );
	heightCur =  BezierCache( heightFrom, heightTo, _t, 0, 0, .5, 1 );
	
	widthCurMid = widthCur/2;
	heightCurMid = heightCur/2;
	
	guiScale = widthCur/DISPLAY.GetGuiWidth();
}