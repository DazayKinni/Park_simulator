window_set_cursor(cr_handpoint);

#macro GAME_SESSION ( instance_exists(obj_controller_game) )

//scaling
width = bbox_right-bbox_left
scale = DISPLAY.GetGuiWidth()/CAMERA.widthCur;
rad = width/2/scale;

//gui positioning
guiX = 0;
guiY = 0;

//object selection
xClick = x;
yClick = y;
objSelected = noone;

xFrom = x;
yFrom = y;

myID = 0;
leftHeld = device_mouse_check_button(myID,mb_left)
leftClick = device_mouse_check_button_pressed(myID,mb_left);
leftReleased = device_mouse_check_button_released(myID,mb_left);

dragged = false;

//cell tracking
cellX = 0;
cellY = 0;
cellXMid = 0;
cellYMid = 0;
gridX = 0;
gridY = 0;

//methods
function GetGameobjectOnClick()
{
	var _list = ds_list_create();
	var _count = collision_point_list( x, y, obj_gameobject, true, true, _list, false );
	if ( _count > 0 )
	{
		if ( _count == 1 ) return _list[| 0];
		
		var _depthList = ds_list_create();
		//loop through the list and see if we're clicking on any villagers, storing their id
		for ( var i = 0; i < _count; i++ )
		{
			var _inst = _list[| i];
			if ( _inst.objectClass == OBJECT_CLASS.VILLAGER ) ds_list_add(_depthList,_inst);
		}
		
		//if we have villagers, return the closest to the camera
		var _y = 10000000,
			_len = ds_list_size(_depthList),
			_closestInst = noone;
		if ( _len > 0 )
		{
			for ( var i = 0; i < _len; i++ )
			{
				var _inst = _depthList[| i];
				if ( _inst.y < _y ) _closestInst = _inst;
			}
		}
		else //otherwise loop through everything else that was clicked and return the closest
		{
			for ( var i = 0; i < ds_list_size(_list); i++ )
			{
				var _inst = _list[| i];
				if ( _inst.y < _y ) _closestInst = _inst;
			}
		}
		return _closestInst;
	}
	
	return noone;
}