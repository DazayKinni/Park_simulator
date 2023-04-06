target = noone;

enum CAM_SHAKE { JitterTimed, JitterTailOff, OffsetTimed, OffsetTailOff, Inactive }
enum CAM_STATE { IDLE, FOLLOW, PAN, PEEK }
state = CAM_STATE.IDLE;

#macro CAM_DAMPING .035
#macro CAM_SPEED_LIMIT 1.5
#macro CAM_BRAKE 0.1

global.camera = id;
#macro CAMERA global.camera

//player assignment
myID = 0;

//scaling
width =			DISPLAY.GetCameraWidth();
height =		DISPLAY.GetCameraHeight();
	
widthCur =		width;
heightCur =		height;

widthCurMid =	width/2;
heightCurMid =	height/2
	
widthFrom =		width;
widthTo =		width;
	
heightFrom =	height;
heightTo =		height;
	
factor = 1;
timer = 60;
tick = timer;

zoomCur = 1;

guiScale = width/DISPLAY.GetGuiWidth();

xSpd = 0;
ySpd = 0;

//dragging
dragFactor = 0.1;		//factor of camera width and height to create a drag box in
drag = function()
{
	var _xoff = widthCur*dragFactor,
		_yoff = heightCur*dragFactor;
		
	dragX1 = x - _xoff;
	dragX2 = x + _xoff;
	dragY1 = y - _yoff;
	dragY2 = y + _yoff;
}	
drag();

//panning
xFromGui = 0;
yFromGui = 0;
xMoveGui = 0;
yMoveGui = 0;

//shaking
shakeX = 0;
shakeY = 0;
shakeRemain = 0;
shakeInc = 0;
shakeTimer = 0;
shakeMode = CAM_SHAKE.Inactive;

event_user(0);	//set up methods