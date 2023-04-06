/// @desc POSITION
 
drag();
 
switch state
{
	case CAM_STATE.IDLE :
	
	break;
	
	case CAM_STATE.FOLLOW :
		if ( instance_exists(target) )
		{
			var _inBox = collision_rectangle( dragX1, dragY1, dragX2, dragY2, target, false, true );
			if !_inBox
			{
				var _xTo = clamp( target.x, widthCurMid, room_width-widthCurMid );
				var _yTo = clamp( target.y, heightCurMid, room_height-heightCurMid );	

				var _xspd = ( _xTo - x ) * CAM_DAMPING,
					_yspd = ( _yTo - y ) * CAM_DAMPING,
					_xfrom = x,
					_yfrom = y;
				
				x += clamp( _xspd, -CAM_SPEED_LIMIT, CAM_SPEED_LIMIT );
				y += clamp( _yspd, -CAM_SPEED_LIMIT, CAM_SPEED_LIMIT );
				
				xSpd = x - _xfrom;
				ySpd = y - _yfrom;
			}
			else
			{
				x += xSpd;
				y += ySpd;
				xSpd = lerp(xSpd,0,CAM_BRAKE);
				ySpd = lerp(ySpd,0,CAM_BRAKE);
			}
		}
		else
		{
			state = CAM_STATE.IDLE
		}
	break;
	
	case CAM_STATE.PAN :
		var _gx = device_mouse_x_to_gui(0),
			_gy = device_mouse_y_to_gui(0);
		
		var _dir = target != noone ? 1 : -1;
		
		x += (_gx - xFromGui)*guiScale*_dir;
		y += (_gy - yFromGui)*guiScale*_dir;
		
		xFromGui = _gx;
		yFromGui = _gy;
		
		/*if ( instance_exists(target) )
		{
			var _buffer = 16;
			x = clamp( x, target.x-widthCurMid+_buffer, target.x+widthCurMid-_buffer );	
			y = clamp( y, target.y-heightCurMid+_buffer, target.y+heightCurMid-_buffer);
		}*/
		
		x = clamp(x,widthCurMid,room_width-widthCurMid);
		y = clamp(y,heightCurMid,room_height-heightCurMid);
		
		if ( CURSOR.leftReleased ) 
		{
			state = target == noone ? CAM_STATE.IDLE : CAM_STATE.FOLLOW;
		}
	break;
}



//position
var _x = x + shakeX - widthCurMid,
	_y = y + shakeY - heightCurMid;

camera_set_view_pos(view_camera[myID],_x,_y);
camera_set_view_size(view_camera[myID],widthCur,heightCur);