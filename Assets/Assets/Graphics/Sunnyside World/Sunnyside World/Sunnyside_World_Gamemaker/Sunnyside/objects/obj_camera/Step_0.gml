///@desc SHAKE
switch ( shakeMode )
{
	case CAM_SHAKE.JitterTimed :
	case CAM_SHAKE.JitterTailOff :
		if ( shakeTimer > 0 )
		{
			shakeTimer--;
			shakeRemain -= shakeInc;
			shakeX = random_range(-shakeRemain,shakeRemain);
			shakeY = random_range(-shakeRemain,shakeRemain);
		}
		else
		{
			shakeMode = CAM_SHAKE.Inactive;	
		}
	break;
	
	case CAM_SHAKE.OffsetTimed :
	case CAM_SHAKE.OffsetTailOff :
		if ( shakeTimer > 0 )
		{
			shakeTimer--;
			shakeRemain -= shakeInc;
			if ( choose(0,1) )
			{
				shakeX = random_range(-shakeRemain,shakeRemain);
				shakeY *= 0.33;
			}
			else
			{
				shakeY = random_range(-shakeRemain,shakeRemain);
				shakeX *=.33;
			}
		}
		else
		{
			shakeMode = CAM_SHAKE.Inactive;
		}
	break;
	
	case CAM_SHAKE.Inactive :
		shakeX = lerp(shakeX,0,0.2);
		shakeY = lerp(shakeY,0,0.2);
	break;
}
