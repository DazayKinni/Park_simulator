function Camera_SetState(_cam_state,_target = noone)
{
	with CAMERA 
	{
		state = _cam_state;
		
		xFromGui = device_mouse_x_to_gui(0);
		yFromGui = device_mouse_y_to_gui(0);
		
		xMoveGui = 0;
		yMoveGui = 0;
		
		target = _target;
	}
}

function Camera_GetState()
{
	return CAMERA.state;	
}

function Camera_SetTarget(_id)
{
	CAMERA.target = _id;	
}

function Camera_GetTarget()
{
	return CAMERA.target;	
}

function Camera_ShakeApply(_type,_size,_duration)
{
	with ( obj_camera )	
	{
		if ( _size < shakeRemain ) return;
		
		shakeMode = _type;
		shakeTimer = _duration;
		shakeRemain = _size;
		
		switch _type
		{
			case CAM_SHAKE.JitterTimed :
			case CAM_SHAKE.OffsetTimed :
				shakeInc = 0;
			break;
			
			case CAM_SHAKE.JitterTailOff :
			case CAM_SHAKE.OffsetTailOff :
				shakeInc = _size/_duration;
			break;
		}
		
		shakeX = random_range(-shakeRemain,shakeRemain);
		shakeY = random_range(-shakeRemain,shakeRemain);
	}
}