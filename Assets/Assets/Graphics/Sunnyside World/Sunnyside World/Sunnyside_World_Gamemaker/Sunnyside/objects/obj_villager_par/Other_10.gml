drawLine = function(_drawpath=false)
{
	if ( selected and CURSOR.leftHeld )
	{
		// draws a straight line
		var _space = 16,
			_dist = point_distance(x,y,CURSOR.x,CURSOR.y),
			_dir = point_direction(x,y,CURSOR.x,CURSOR.y),
			_count = round(_dist/_space),
			_xx = x + lengthdir_x(_space,_dir),
			_yy = y + lengthdir_y(_space,_dir),
			_scale = 1/3,
			_col = c_white;
		
		for ( var i = 0; i < _count-1; i++ )
		{
			draw_sprite_ext( spr_cursor_line_dot, 0, _xx, _yy, _scale, _scale, 0, _col, 1 );
			_xx += lengthdir_x( _space, _dir );
			_yy += lengthdir_y( _space, _dir );
		}
	
		var _pathExists = path_exists(path);
	
		// draws the potential path
		if ( _drawpath and _pathExists )
		{
			var _length = path_get_length(path),
				_idealSpacing = 16,
				_count = floor(_length/_idealSpacing),
				_spacing = 1/_count,
				_pos = _spacing,
				_i = 0,
				_col = c_white;
			
			static _scale = 1/3;
			
			repeat(_count-1)
			{
				draw_sprite_ext( spr_cursor_line_dot, 0, path_get_x(path,_pos), path_get_y(path,_pos), _scale, _scale, 0, _col, 0.5 );
				_pos += _spacing;
				++_i;
			}
		}
	}
}

drawDebug = function()
{
	if ( DEBUG_MODE ) 
	{
		if ( CURSOR.dragged )
		{
			draw_set_color(c_blue);
			if ( path_exists(path) ) draw_path(path,xFrom,yFrom,0);
			draw_set_color(c_white);
		}
	}	
}