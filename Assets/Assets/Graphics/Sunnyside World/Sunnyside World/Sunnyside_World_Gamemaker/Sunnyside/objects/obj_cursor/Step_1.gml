x = device_mouse_x(0);
y = device_mouse_y(0);

leftHeld = device_mouse_check_button(myID,mb_left)
leftClick = device_mouse_check_button_pressed(myID,mb_left);
leftReleased = device_mouse_check_button_released(myID,mb_left);

guiX = RoomCoordsToGUIX(x);
guiY = RoomCoordsToGUIY(y);

if GAME_SESSION	//update coords
{
	gridX = floor(x/MP_GRID_CELL_SIZE);
	gridY = floor(y/MP_GRID_CELL_SIZE);

	cellX = gridX*MP_GRID_CELL_SIZE;
	cellY = gridY*MP_GRID_CELL_SIZE;

	cellXMid = cellX+(MP_GRID_CELL_SIZE/2);
	cellYMid = cellY+(MP_GRID_CELL_SIZE/2);
	
	//grab coords onClick
	if ( leftClick )
	{
		xFrom = x;
		xTo = x;
		yFrom = y;
		yTo = y;
		dragged = false;
	}
	
	//update coord onHold
	if ( leftHeld )
	{
		if ( !dragged )
		{
			if ( x != xFrom or y != yFrom ) dragged = true;
		}
	}
	
	//update scaling so collisions remain consistent to cursor pos if camera zooms
	scale = DISPLAY.GetGuiWidth()/CAMERA.widthCur;
	rad = width/2/scale;
}