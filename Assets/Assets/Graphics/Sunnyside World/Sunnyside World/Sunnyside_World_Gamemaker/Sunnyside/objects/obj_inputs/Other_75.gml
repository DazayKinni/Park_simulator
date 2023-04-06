/// @description
if (async_load[? "event_type"] == "gamepad lost")
{
    if (async_load[? "pad_index"] == gpad[0])
    {
        Trace("obj_inputs: Lost gamepad for player 0 (index=", gpad[0], ")");
        if (os_type == os_switch) switch_controller_support_show();
    }
}

if (async_load[? "event_type"] == "gamepad discovered")
{
    Trace("obj_inputs: Discovered gamepad (index=", async_load[? "pad_index"], ", \"", gamepad_get_description(async_load[? "pad_index"]), "\")");
	
    if (!gamepad_is_connected(gpad[0]))
    {
        gpad[0] = async_load[? "pad_index"];
        gpad_type[0] = ControllerType.Unknown;
        
        switch(os_type)
        {
            case os_switch:
                switch(gamepad_get_description(async_load[? "pad_index"]))
                {
                    case "Handheld":
                        gpad_type[0] = ControllerType.SwitchHandheld;
                    break;
                    
                    case "Joy-Con (L)":
                    case "Joy-Con (R)":
                        gpad_type[0] = ControllerType.SwitchJoyConSingle;
                    break;
                    
                    case "Joy-Con":
                        gpad_type[0] = ControllerType.SwitchJoyConDual;
                    break;
                    
                    case "Pro Controller":
                        gpad_type[0] = ControllerType.SwitchPro;
                    break;
                }
            break;
            
            default:
                switch(gamepad_get_description(async_load[? "pad_index"]))
                {
                    case "XInput STANDARD GAMEPAD":
                        gpad_type[0] = ControllerType.Xbox360;
                    break;
                    
                    case "Sony DualShock 4":
                        gpad_type[0] = ControllerType.PlayStation4;
                    break;
                }
            break;
        }
    }
}