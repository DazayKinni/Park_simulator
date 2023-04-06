function Input_StepGamepads()
{
	for ( var i = 0; i < gpInputs; i++ )
	{
		var gamepad = gpad[i];

		//look for stick checks
		left_stick_xinput[i] = gamepad_axis_value(gamepad, gp_axislh);
		left_stick_yinput[i] = gamepad_axis_value(gamepad, gp_axislv);
		right_stick_xinput[i] = gamepad_axis_value(gamepad, gp_axisrh);
		right_stick_yinput[i] = gamepad_axis_value(gamepad, gp_axisrv);

		left_stick_check[i,Stick.Left]  = (left_stick_xinput[i] < -gamepadDeadZone);
		left_stick_check[i,Stick.Right] = (left_stick_xinput[i] >  gamepadDeadZone);
		left_stick_check[i,Stick.Up]    = (left_stick_yinput[i] < -gamepadDeadZone);
		left_stick_check[i,Stick.Down]  = (left_stick_yinput[i] >  gamepadDeadZone);
		right_stick_check[i,Stick.Left]  = (right_stick_xinput[i] < -gamepadDeadZone);
		right_stick_check[i,Stick.Right] = (right_stick_xinput[i] >  gamepadDeadZone);
		right_stick_check[i,Stick.Up]    = (right_stick_yinput[i] < -gamepadDeadZone);
		right_stick_check[i,Stick.Down]  = (right_stick_yinput[i] >  gamepadDeadZone);
	
		//reset presses and releases on the stick
		for ( var j = 0; j < 4; j++ ) 
		{
			left_stick_press[i,j] = false;
			left_stick_release[i,j] = false;
			if ( left_stick_ready[i,j] && left_stick_check[i,j] ) 
			{
				left_stick_press[i,j] = true;
				left_stick_ready[i,j] = false;
			} 
			else if ( !left_stick_check[i,j] && !left_stick_ready[i,j] ) 
			{
				left_stick_release[i,j] = true;
				left_stick_ready[i,j] = true;
			}
			right_stick_press[i,j] = false;
			right_stick_release[i,j] = false;
			if ( right_stick_ready[i,j] && right_stick_check[i,j] ) 
			{
				right_stick_press[i,j] = true;
				right_stick_ready[i,j] = false;
			} 
			else if ( !right_stick_check[i,j] && !right_stick_ready[i,j] ) 
			{
				right_stick_release[i,j] = true;
				right_stick_ready[i,j] = true;
			}
		}

		//We don't want to allow any input from the "triggers" on a single horizontal Joy-Con
		//GameMaker will continue to report the triggers even though they're positioned in the palm of the player's hand...
		var _allow_triggers = gpad_type[i] != ControllerType.SwitchJoyConSingle;
	
		//gamepad inputs
		gpad_left[i]  = gamepad_button_check( gamepad, gp_padl) || left_stick_check[i,Stick.Left] || keyboard_check( vk_left );
		gpad_right[i] = gamepad_button_check( gamepad, gp_padr) || left_stick_check[i,Stick.Right] || keyboard_check( vk_right );
		gpad_up[i]    = gamepad_button_check( gamepad, gp_padu) || left_stick_check[i,Stick.Up] || keyboard_check( vk_up );
		gpad_down[i]  = gamepad_button_check( gamepad, gp_padd) || left_stick_check[i,Stick.Down] || keyboard_check( vk_down );
		gpad_a[i]     = gamepad_button_check( gamepad, swapAB? gp_face2 : gp_face1 ) || keyboard_check( vk_space );
		gpad_b[i]     = gamepad_button_check( gamepad, swapAB? gp_face1 : gp_face2 );
		gpad_y[i]     = gamepad_button_check( gamepad, swapAB? gp_face3 : gp_face4 );
		gpad_x[i]     = gamepad_button_check( gamepad, swapAB? gp_face4 : gp_face3 );
		gpad_l[i]	  = gamepad_button_check( gamepad, gp_shoulderl );
		gpad_r[i]     = gamepad_button_check( gamepad, gp_shoulderr );
		gpad_zl[i]    = _allow_triggers && gamepad_button_check( i, gp_shoulderlb );
		gpad_zr[i]    = _allow_triggers && gamepad_button_check( i, gp_shoulderrb );
		gpad_start[i] = gamepad_button_check( gamepad, gp_start );
	
		gpad_press_left[i]  = gamepad_button_check_pressed( gamepad, gp_padl) || left_stick_press[i,Stick.Left] || keyboard_check_pressed( vk_left );
		gpad_press_right[i] = gamepad_button_check_pressed( gamepad, gp_padr) || left_stick_press[i,Stick.Right] || keyboard_check_pressed( vk_right );
		gpad_press_up[i]    = gamepad_button_check_pressed( gamepad, gp_padu) || left_stick_press[i,Stick.Up] || keyboard_check_pressed( vk_up );;
		gpad_press_down[i]  = gamepad_button_check_pressed( gamepad, gp_padd) || left_stick_press[i,Stick.Down] || keyboard_check_pressed( vk_down );
		gpad_press_a[i]     = gamepad_button_check_pressed( gamepad, swapAB? gp_face2 : gp_face1) || keyboard_check_pressed( vk_space );
		gpad_press_b[i]     = gamepad_button_check_pressed( gamepad, swapAB? gp_face1 : gp_face2);
		gpad_press_y[i]     = gamepad_button_check_pressed( gamepad, swapAB? gp_face3 : gp_face4);
		gpad_press_x[i]     = gamepad_button_check_pressed( gamepad, swapAB? gp_face4 : gp_face3);
		gpad_press_l[i]     = gamepad_button_check_pressed( gamepad, gp_shoulderl );
		gpad_press_r[i]     = gamepad_button_check_pressed( gamepad, gp_shoulderr );
		gpad_press_zl[i]     = _allow_triggers && gamepad_button_check_pressed( i, gp_shoulderlb );
		gpad_press_zr[i]     = _allow_triggers && gamepad_button_check_pressed( i, gp_shoulderrb );
		gpad_press_start[i] = gamepad_button_check_pressed( gamepad, gp_start );
	
		gpad_release_left[i]  = gamepad_button_check_released( gamepad, gp_padl) || left_stick_release[i,Stick.Left] || keyboard_check_released( vk_left );
		gpad_release_right[i] = gamepad_button_check_released( gamepad, gp_padr) || left_stick_release[i,Stick.Right] || keyboard_check_released( vk_right );
		gpad_release_up[i]    = gamepad_button_check_released( gamepad, gp_padu) || left_stick_release[i,Stick.Up] || keyboard_check_released( vk_up );
		gpad_release_down[i]  = gamepad_button_check_released( gamepad, gp_padd) || left_stick_release[i,Stick.Down] || keyboard_check_released( vk_down );
		gpad_release_a[i]     = gamepad_button_check_released( gamepad, swapAB? gp_face2 : gp_face1) || keyboard_check_released( vk_space );
		gpad_release_b[i]     = gamepad_button_check_released( gamepad, swapAB? gp_face1 : gp_face2);
		gpad_release_y[i]     = gamepad_button_check_released( gamepad, swapAB? gp_face3 : gp_face4);
		gpad_release_x[i]     = gamepad_button_check_released( gamepad, swapAB? gp_face4 : gp_face3);
		gpad_release_l[i]     = gamepad_button_check_released( gamepad, gp_shoulderl );
		gpad_release_r[i]     = gamepad_button_check_released( gamepad, gp_shoulderr );
		gpad_release_zl[i]    = _allow_triggers && gamepad_button_check_released( i, gp_shoulderlb );
		gpad_release_zr[i]    = _allow_triggers && gamepad_button_check_released( i, gp_shoulderrb );
		gpad_release_start[i] = gamepad_button_check_released( gamepad, gp_start );
	}
}