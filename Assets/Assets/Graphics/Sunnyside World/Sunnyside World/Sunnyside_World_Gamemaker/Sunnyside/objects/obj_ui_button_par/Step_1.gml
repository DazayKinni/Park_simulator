/// @desc

//check for a press on the gui and tell this button to do something
if device_mouse_x_to_gui(0) > x1 
&& device_mouse_x_to_gui(0) < x2 
&& device_mouse_y_to_gui(0) > y1 
&& device_mouse_y_to_gui(0) < y2
&& device_mouse_check_button_pressed( 0, mb_any )
{
	event_user(MENU_EVENT.ONCLICK);
}

transform.Tick();