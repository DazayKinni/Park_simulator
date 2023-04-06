CONTINUE

switch ( myState )
{
	case VILLAGER.IDLE :
		setSprite( selected ? sprite.jump : sprite.idle );
	break;
	
	case VILLAGER.MOVE :
		setSprite( curSpd > 1.5 ? sprite.run : sprite.walk );
		curSpd = Approach(curSpd,mySpd,0.05);
		path_speed = curSpd;
		
		//sfx
		with ( sfx )
		{
			if ( tick > 0 ) tick--;
			else
			{
				tick = timer;	
				VinylPlay( array[irandom(array_length(array)-1)],0,1,random_range(0.95,1.05) );
			}
		}
		
		if ( path_position == 1 )
		{
			myState = VILLAGER.IDLE;
			curSpd = 0;
		}
		
		SetDepth();
	break;
}

//selection logic
if ( selected )
{
	if ( path_exists(path) )
	{
		var _xx = CURSOR.x,
			_yy = CURSOR.y,
			_cx = PathfinderGetCellX(_xx,1),
			_cy = PathfinderGetCellY(_yy,1);
		//checks the cell we're hovering over for a move
		mp_grid_path( MP_GRID, path, x, y, _cx, _cy, 1 );
		
		if ( CURSOR.dragged )
		{
			/*var _data = TownplannerGetData( _cx,_cy );
			if ( _data != 0 )
			{
				//Trace(_data);
				//show_message(_data);
			}*/
			
			//instigates a move
			if ( CURSOR.leftReleased )
			{
				StartMove();
				
				var _data = TownplannerGetData( _cx,_cy ); 
				if ( _data != 0 )
				{
					Trace(_data);	
				}
				
				selected = false;
				CURSOR.objSelected = noone;
			}
		}
	}
}

//animation
with ( sprite )
{
	if ( img < imgMax ) img += imgSpd;
	else img = 0;
}

if ( tileHighlightAlpha > 0 )
{
	if ( current_time > timeMoveStarted + 500 ) 	
	{
		tileHighlightAlpha -= 0.05;
	}
}

//sound