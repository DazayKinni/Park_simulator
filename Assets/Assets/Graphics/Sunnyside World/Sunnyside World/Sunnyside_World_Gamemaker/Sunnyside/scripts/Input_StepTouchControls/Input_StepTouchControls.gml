function Input_StepTouchControls()
{
	for ( var i = 0; i < touchInputs; i++ ) 
	{
		var mx = device_mouse_x( i );
		var my = device_mouse_y( i );
		var gx = device_mouse_x_to_gui( i );
		var gy = device_mouse_y_to_gui( i );
	
		flicked_right[i] = false;
		flicked_left[i] = false;
		flicked_up[i] = false;
		flicked_down[i] = false;
	
		//mouse/touch logic on the frame it is pressed
		if device_mouse_check_button_pressed(i,mb_any) 
		{
			pressTime[i] = 0;
			steps_x[i] = ds_list_create();
			steps_y[i] = ds_list_create();
			press_x[i] = mx; // x coord where press initiated
			press_x[i] = my; // y coord
			press_gui_x[i] = gx; //gui x coord where press initiated
			press_gui_y[i] = gy; // y coord
		}

		//mouse/touch checks while button is down
		if device_mouse_check_button(i,mb_any) 
		{
			// increase time and grab coords
			pressTime[i]++;
			check_x[i] = mx; // x coord
			check_y[i] = my; // y coord
			check_gui_x[i] = gx;
			check_gui_y[i] = gy;
	
			// store the last X steps coords and determine swipe speed and direction
		
			//add an entry to the list and remove any above the sample threshold
			ds_list_add(steps_x[i], mx ); // x coord
			ds_list_add(steps_y[i], my); // y coord
			while (ds_list_size(steps_x[i]) > flickSamples) { ds_list_delete(steps_x[i], 0); }
			while (ds_list_size(steps_y[i]) > flickSamples) { ds_list_delete(steps_y[i], 0); }
		
			//calculate the current swiping speed and direction
			swipe_speed_x[i] = ( device_mouse_x(i) - ds_list_find_value(steps_x[i], 0) ); // speed = distance / time
			swipe_speed_y[i] = ( device_mouse_y(i) - ds_list_find_value(steps_y[i], 0) ); // speed = distance / time
			swipe_dir[i] = point_direction(ds_list_find_value(steps_x[i], 0), ds_list_find_value(steps_y[i], 0), check_x[i], check_y[i]); // save the direction we are dragging in
			//if the player is swiping in any direction detect a drag
			if ( (swipe_speed_x[i] != 0) || (swipe_speed_y[i] != 0) ) dragging[i] = true;
		}
	
		//mouse/touch checks on the frame button is released
		if device_mouse_check_button_released(i,mb_any)
		{
			//detect/flag flicks
			if ( swipe_speed_x[i] > flickSensitivity ) { flicked_right[i] = true; }
			else if ( swipe_speed_x[i] < -flickSensitivity ) { flicked_left[i] = true; }

			if ( swipe_speed_y[i] > flickSensitivity ) { flicked_down[i] = true; }
			else if ( swipe_speed_y[i] < -flickSensitivity ) { flicked_up[i] = true; }
		
			ds_list_clear( steps_x[i] );
			ds_list_clear( steps_y[i] );
			dragging[i] = false;
		}
	}
}