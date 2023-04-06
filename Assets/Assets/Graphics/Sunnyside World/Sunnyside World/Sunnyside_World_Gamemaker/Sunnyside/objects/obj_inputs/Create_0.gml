/// @description

gpInputs = 1;			//how many gamepad controllers we should initialise and check
touchInputs = 2;		//number of touchscreen inputs we should init / check
flickSensitivity = 28;	//flick threshold speed
flickSamples = 5;		//how many steps touch inputs will be sampled to determine sensitivity value
gamepadDeadZone = 0.3;  //Manual implementation of a deadzone check
swapAB = true;          //Whether to swap A/B buttons, relative to an Xbox 360 controller. In reality, this just swaps gp_face1 and gp_face2 over

enum ControllerType
{
    Unknown,
    SwitchHandheld,
    SwitchJoyConDual,
    SwitchJoyConSingle,
    SwitchPro,
    PlayStation4,
    Xbox360,
    XboxOne,
}

enum Stick { Left, Right, Up, Down }
enum User { P1, P2, P3, P4 }

//initialise gamepad inputs
for ( var i = 0; i < gpInputs; i++ ) 
{
    gpad[i] = -1;							//assigns a device index
    gpad_type[i] = ControllerType.Unknown;	//assigns a controller type
	Gamepad_ResetInputs(i);
}

//Find the lowest indexed gamepad that's connected and use it
var _i = 0;
repeat(gamepad_get_device_count())
{
    if (gamepad_is_connected(_i))
    {
        gpad[0] = _i;
        break;
    }
    ++_i;
}

for ( var i = 0; i < touchInputs; i ++ ) 
{
	dragging[i] = false;
	check_x[i] = 0;
	check_y[i] = 0;
	check_gui_x[i] = 0;
	check_gui_y[i] = 0;
	press_x[i] = 0;
	press_y[i] = 0;
	press_gui_x[i] = 0;
	press_gui_y[i] = 0;
	swipe_dir[i] = 0;
	swipe_speed_x[i] = 0;
	swipe_speed_y[i] = 0;
	flicked_right[i] = false;
	flicked_left[i] = false;
	flicked_up[i] = false;
	flicked_down[i] = false;
	pressTime[i] = 0;
}