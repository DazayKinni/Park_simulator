function RoomCoordsToGUIX(_roomX)
{
	var _scale =  DISPLAY.GetGuiWidth()/CAMERA.widthCur;
	return _scale * ( _roomX - CAMERA.x + CAMERA.widthCurMid );
}

function RoomCoordsToGUIY(_roomY)
{
	var _scale =  DISPLAY.GetGuiHeight()/CAMERA.heightCur;
	return _scale * ( _roomY - CAMERA.y + CAMERA.heightCurMid );
}