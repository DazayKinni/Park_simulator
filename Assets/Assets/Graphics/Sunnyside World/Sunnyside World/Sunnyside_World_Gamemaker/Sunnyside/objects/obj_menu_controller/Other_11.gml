/// @desc draw calls

drawSidePanels = function()
{	
	with ( obj_menu_sidepanel )
	{
		if ( !show ) exit;
		
		draw_sprite_stretched_ext( spr_pixel, 0, 0, 0, DISPLAY.GetGuiWidth(), DISPLAY.GetGuiHeight(), c_black, 0.3 * alpha );
	
		var _x1 = left + xPos,
			_x2 = right - xPos;
			
		if ( DEBUG_MODE )
		{
			draw_line( _x1, 0, _x1, DISPLAY.GetGuiHeight() );
			draw_line( _x2, 0, _x2, DISPLAY.GetGuiHeight() );
		}
			
		draw_sprite_pos( spr_logos_pixel, 1, 
							_x1 + xCoordsL[0], 0,
							_x1 + xCoordsL[1], 0,
							_x1 + xCoordsL[2], DISPLAY.GetGuiHeight(),
							_x1 + xCoordsL[3], DISPLAY.GetGuiHeight(), 
							alpha );
		
		draw_sprite_pos( spr_logos_pixel, 1, 
							_x2 + xCoordsR[0], 0,
							_x2 + xCoordsR[1], 0,
							_x2 + xCoordsR[2], DISPLAY.GetGuiHeight(),
							_x2 + xCoordsR[3], DISPLAY.GetGuiHeight(), 
							alpha );
	}
}

drawButtons = function()
{
	with ( obj_ui_button_menu_pill )
	{
		if (transform.draw)
		{
		    transform.ApplyTransform(x, y);
				draw_pill(0, 0, boxW, boxH, pillCol, 1, true, true);
				Apply();
				scribbleElement.draw(textX, 0);
		    TransformReset();
		}
	}
	
	with ( obj_ui_button_menu_sprite )
	{
		if (transform.draw)
		{
		    transform.ApplyTransform(x, y);
				draw_sprite_ext(sprite_index,image_index,0,0,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		    TransformReset();
		}
	}
	
	with ( obj_ui_button_menu_settings )
	{
		if (transform.draw)
		{
		    transform.ApplyTransform(x, y);
				draw_pill(0, 0, boxW, boxH, pillCol, .5, true);
				
				switch myState
				{
					case SETTINGSBUTTON.TOGGLE :
						if ( toggleState ) draw_pill(0, 0, boxW, boxH, pillCol, 1, true);
					break;
					
					case SETTINGSBUTTON.SLIDER :
						var _xx = -boxW/2,
							_yy = -boxH/2;
						draw_pill(_xx, _yy, boxH+fillWidth, boxH, c_white, 1);
					break;
					
					case SETTINGSBUTTON.TRIGGER :
						draw_pill(0, 0, boxW, boxH, pillCol, 1, true);
					break;
				}
				
				Apply();	
				scribbleElement.draw(textX, 0);
		    TransformReset();
		}
	}	
}

drawTitles = function()
{
	with ( obj_menu_gametitle )
	{
		if (transform.draw)
		{
			transform.ApplyTransform(x, y);
				scribbleElement = scribble(Lyre(locKey))
				.blend(COL_TEMP_MENU_TEXT_LT_GREY,1.0)
				.scale(8)
				.msdf_border(c_black,1.5)
				.msdf_shadow(c_black, 0, 0, 0)
				.align(fa_center, fa_middle)
				.draw(0, 0);
			TransformReset();
		}		
	}
}

drawLogo = function()
{
	with ( obj_ui_button_debug )
	{
		if (transform.draw)
		{
			
			transform.ApplyTransform(x,y)
			
				draw_sprite_ext( spr_logos_broxcorp, 0, -4, 4 , 1, 1, 0, c_black, global.debugState ? 0.25 : 0 );	
				hitflash.DrawStart();
				draw_sprite_ext( spr_logos_broxcorp, 0, 0,0 , 1, 1, 0, c_white,  global.debugState ? 1 : 0.5 );	
				hitflash.DrawEnd();
				
			TransformReset();	
	
				var _x = x + 50,
					_y = y - 37.5,
					_c = c_white,
					_a = global.debugState ? 1 : 0.5;
	
				scribble( Lyre(appVersion.title) )
				.scale(0.85)
				.blend(_c,_a)
				.align(fa_left,fa_top)
				.msdf_border(c_black,0)
				.msdf_shadow(c_black, 0.25, -2, 2)
				.draw( _x, _y )
		
				_y += 25;
	
				scribble( appVersion.version )
				.scale(0.75)
				.blend(_c,_a)
				.align(fa_left,fa_top)
				.msdf_border(c_black,0)
				.msdf_shadow(c_black, 0.25, -2, 2)
				.draw( _x, _y )
		
				_y += 22;
	
				scribble( appVersion.copyright )
				.scale(0.75)
				.blend(_c,_a)
				.align(fa_left,fa_top)
				.msdf_border(c_black,0)
				.msdf_shadow(c_black, 0.25, -2, 2)
				.draw( _x, _y )
			
		}
	}
}

drawGallerySlides = function()
{	
	with ( obj_menu_gallery )
	{
		draw_sprite_ext( sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
	}
}

drawHeader = function()
{
	with ( obj_menu_header )
	{
		if ( transform.draw )
		{
			transform.ApplyTransform(x,y);
				draw_pill( 0, 0, width, height, pillCol, pillAlpha, true, true );
				
				scribble(Lyre(locKey))
					.scale(2.5)
					.blend(c_black,1.0)
					.align(fa_center,fa_middle)
					.draw(0,0)
				
			TransformReset();	
		}
	}
}

drawLoader = function()
{
	with ( obj_menu_goto )
	{
		var _off = width/2;
		draw_pill( x, y, width+8, height+8, c_white, 0.5, true );
		draw_pill( x-_off, y-(height/2), curWidth, height, c_white, 1.0 );
	}
}