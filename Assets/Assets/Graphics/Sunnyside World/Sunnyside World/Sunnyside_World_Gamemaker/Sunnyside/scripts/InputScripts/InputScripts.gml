function InputScripts(){}

enum Button { Up, Down, Left, Right, A, B, Y, X, L, R, ZL, ZR, Start }
enum Gesture { Check, Press, Release }

/// @arg device 
/// @arg Gesture
/// @arg [Button...]
function Gamepad_GetInput() 
{
	var i = argument[0];
	var _gesture = argument[1];

	with ( obj_inputs ) 
	{
		//argument count includes a gesture but not a specific button
		if ( argument_count <= 2 ) 
		{
			switch _gesture 
			{
				case Gesture.Check :
					if ( gpad_left[i] || gpad_right[i] || gpad_up[i] || gpad_down[i] || gpad_a[i] || gpad_b[i] || gpad_y[i] || gpad_x[i] || gpad_l[i] || gpad_r[i] || gpad_zl[i] || gpad_zr[i] || gpad_start[i] ) { return true; exit; }
				break;
	
				case Gesture.Press :
					if ( gpad_press_left[i] || gpad_press_right[i] || gpad_press_up[i] || gpad_press_down[i] || gpad_press_a[i] || gpad_press_b[i] || gpad_press_y[i] || gpad_press_x[i] || gpad_press_l[i] || gpad_press_r[i] || gpad_press_zl[i] || gpad_press_zr[i] || gpad_press_start[i] ) { return true; exit; }
				break;
	
				case Gesture.Release :
					if ( gpad_release_left[i] || gpad_release_right[i] || gpad_release_up[i] || gpad_release_down[i] || gpad_release_a[i] || gpad_release_b[i] || gpad_release_y[i] || gpad_release_x[i] || gpad_release_l[i] || gpad_release_r[i] ||gpad_release_zl[i] || gpad_release_zr[i] || gpad_release_start[i] ) { return true; exit; }
				break;
			}
		} 
		else 
		{
		//argument count includes a button too, and we should check for that
			var _button = argument[2];
			switch _gesture 
			{
				case Gesture.Check :
					switch _button 
					{
						case Button.Up				: return gpad_up[i]; exit;		break;
						case Button.Down			: return gpad_down[i]; exit;	break;
						case Button.Left			: return gpad_left[i]; exit;	break;
						case Button.Right			: return gpad_right[i]; exit;	break;
						case Button.A				: return gpad_a[i]; exit;		break;
						case Button.B				: return gpad_b[i]; exit;		break;
						case Button.Y				: return gpad_y[i]; exit;		break;
						case Button.X				: return gpad_x[i]; exit;		break;
						case Button.L				: return gpad_l[i]; exit;		break;
						case Button.R				: return gpad_r[i]; exit;		break;
						case Button.ZL				: return gpad_zl[i]; exit;		break;
						case Button.ZR				: return gpad_zr[i]; exit;		break;
						case Button.Start			: return gpad_start[i]; exit;	break;
					}
				break;
			
				case Gesture.Press :
					switch _button 
					{
						case Button.Up				: return gpad_press_up[i]; exit;		break;
						case Button.Down			: return gpad_press_down[i]; exit;		break;
						case Button.Left			: return gpad_press_left[i]; exit;		break;
						case Button.Right			: return gpad_press_right[i]; exit;		break;
						case Button.A				: return gpad_press_a[i]; exit;			break;
						case Button.B				: return gpad_press_b[i]; exit;			break;
						case Button.Y				: return gpad_press_y[i]; exit;			break;
						case Button.X				: return gpad_press_x[i]; exit;			break;
						case Button.L				: return gpad_press_l[i]; exit;			break;
						case Button.R				: return gpad_press_r[i]; exit;			break;
						case Button.ZL				: return gpad_press_zl[i]; exit;			break;
						case Button.ZR				: return gpad_press_zr[i]; exit;			break;
						case Button.Start			: return gpad_press_start[i]; exit;		break;
					}
				break;
			
				case Gesture.Release :
					switch _button 
					{
						case Button.Up				: return gpad_release_up[i]; exit;		break;
						case Button.Down			: return gpad_release_down[i]; exit;	break;
						case Button.Left			: return gpad_release_left[i]; exit;	break;
						case Button.Right			: return gpad_release_right[i]; exit;	break;
						case Button.A				: return gpad_release_a[i]; exit;		break;
						case Button.B				: return gpad_release_b[i]; exit;		break;
						case Button.Y				: return gpad_release_y[i]; exit;		break;
						case Button.X				: return gpad_release_x[i]; exit;		break;
						case Button.L				: return gpad_release_l[i]; exit;		break;
						case Button.R				: return gpad_release_r[i]; exit;		break;
						case Button.ZL				: return gpad_release_zl[i]; exit;		break;
						case Button.ZR				: return gpad_release_zr[i]; exit;		break;
						case Button.Start			: return gpad_release_start[i]; exit;	break;
					}
				break;
			}
		}
	}
}

/// @arg device
function Gamepad_ResetInputs(i)
{
	//converting stick inputs to presses and releases
	for ( var j = 0; j < 4; j++ ) 
	{
		left_stick_ready[i][j] = false;
		left_stick_check[i][j] = false;
		left_stick_press[i][j] = false;
		left_stick_release[i][j] = false;
		right_stick_ready[i][j] = false;
		right_stick_check[i][j] = false;
		right_stick_press[i][j] = false;
		right_stick_release[i][j] = false;
	}
	left_stick_xinput[i] = 0;
	left_stick_yinput[i] = 0;
	right_stick_xinput[i] = 0;
	right_stick_yinput[i] = 0;
	
	//gamepad inputs
	gpad_left[i] = false;
	gpad_right[i] = false;
	gpad_up[i] = false;
	gpad_down[i] = false;
	gpad_a[i] = false;
	gpad_b[i] = false;
	gpad_y[i] = false;
	gpad_x[i] = false;
	gpad_l[i] = false;
	gpad_zl[i] = false;
	gpad_r[i] = false;
	gpad_zr[i] = false;
	gpad_start[i] = false;
	
	gpad_press_left[i] = false;
	gpad_press_right[i] = false;
	gpad_press_up[i] = false;
	gpad_press_down[i] = false;
	gpad_press_a[i] = false;
	gpad_press_b[i] = false;
	gpad_press_y[i] = false;
	gpad_press_x[i] = false;
	gpad_press_l[i] = false;
	gpad_press_zl[i] = false;
	gpad_press_r[i] = false;
	gpad_press_zr[i] = false;
	gpad_press_start[i] = false;
	
	gpad_release_left[i] = false;
	gpad_release_right[i] = false;
	gpad_release_up[i] = false;
	gpad_release_down[i] = false;
	gpad_release_a[i] = false;
	gpad_release_b[i] = false;
	gpad_release_y[i] = false;
	gpad_release_x[i] = false;
	gpad_release_l[i] = false;
	gpad_release_zl[i] = false;
	gpad_release_r[i] = false;
	gpad_release_zr[i] = false;
	gpad_release_start[i] = false;
}

function Gamepad_GetThumbstickX(_device,_left) 
{
	with (obj_inputs) { return _left ? left_stick_xinput[_device] : right_stick_xinput[_device]; }
	return 0.0;
}

function Gamepad_GetThumbstickY(_device,_left) 
{
	with (obj_inputs) { return _left ? left_stick_yinput[_device] : right_stick_yinput[_device]; }
	return 0.0;
}

//next up - extract some of the touch input stuff into methods. Add checks to enable switching off touch and gamepad to lower overheads.

function Touch_GetPressTime(i) 
{ 
	with ( obj_inputs ) return pressTime[i]; 
}

function Touch_GetPressedX(i)			//returns x coord in the room where the user pressed
{
	with ( obj_inputs ) return press_x[i];
}
function Touch_GetPressedY(i)			//returns y coord
{
	with ( obj_inputs ) return press_y[i];
}
function Touch_GetPressedGuiX(i)		//returns x coord on the gui where the user pressed
{
	with ( obj_inputs ) return press_gui_x[i];
}
function Touch_GetPressedGuiY(i)		//returns y coord
{
	with ( obj_inputs ) return press_gui_y[i];
}

/// @arg i
/// @arg Flick.direction
function Touch_GetFlick()				//returns if the screen was flicked
{
	enum Flick { Any, Up, Down, Left, Right }
	with ( obj_inputs )
	{
		if ( argument0 < touchInputs )
		{
			switch argument1
			{
				case Flick.Up :		return flicked_up[i]; break;
				case Flick.Down :	return flicked_down[i]; break;
				case Flick.Left :	return flicked_left[i]; break;
				case Flick.Right :	return flicked_right[i]; break;
				case Flick.Any :	return flicked_up[i] && flicked_down[i] && flicked_left[i] && flicked_right[i]; break;
			}
		}
	}
}

function Touch_GetSwipeSpeed(i)			//returns the current swipe speed
{
	with ( obj_inputs )
	{
		return point_distance( 0, 0, swipe_speed_x[i], swipe_speed_y[i] );
	}
}
function Touch_GetDragging(i)			//returns if the user is dragging (simpler way of saying swipe speed > 0)
{
	with ( obj_inputs )
	{
		return dragging[i];	
	}
}
