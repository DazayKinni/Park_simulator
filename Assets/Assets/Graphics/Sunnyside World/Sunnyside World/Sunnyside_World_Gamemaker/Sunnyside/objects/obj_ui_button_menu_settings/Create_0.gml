event_inherited();

enum SETTINGSBUTTON { TOGGLE, SLIDER, TRIGGER }
myState = SETTINGSBUTTON.SLIDER;

toggleState = true;

locKey = "splash begin";

scribbleElement = undefined;
targetRoom = undefined;
	
pillCol = COL_TEMP_MENU_BLUE;
textCol = COL_TEMP_MENU_TEXT_LT_GREY;
	
padding = 30;
boxH = 0;
boxW = 0;

boxMaxW = 500;
boxMaxH = 200;

fixedWidth = false;

textAlign = fa_center;
textX = 0;
		
x1 = x - (boxW/2);
x2 = x1 + boxH;
y1 = y - (boxH/2);
y2 = y1 + boxH;

SetCoords();

///slider vars
fillFactor = random(0.75);
minWidth = boxH;
remainingWidth = boxW-minWidth;
fillWidth = minWidth+(remainingWidth*fillFactor);
sliderInc = 0.1;