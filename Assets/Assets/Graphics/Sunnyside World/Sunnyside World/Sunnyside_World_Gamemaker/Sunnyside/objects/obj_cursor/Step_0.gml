CONTINUE

//left click events
if ( leftClick )
{
	obj_gameobject.selected = false;
	var _obj = GetGameobjectOnClick();
	if ( _obj > 0 ) 
	{
		if ( _obj != objSelected )
		{
			objSelected = _obj;	
		}
		_obj.onSelect = true;
		
		//set other game stuff up depending on object class
		switch _obj.objectClass
		{
			case OBJECT_CLASS.VILLAGER :
				Camera_SetState(CAM_STATE.PAN,_obj);
			break;
		}
	}
	else
	{
		Camera_SetState( CAM_STATE.PAN )
	}
}