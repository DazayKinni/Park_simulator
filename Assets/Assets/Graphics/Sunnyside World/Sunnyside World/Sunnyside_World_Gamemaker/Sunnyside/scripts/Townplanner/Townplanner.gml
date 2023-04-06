#macro D_GRID obj_controller_game.dGrid

function TownplannerInit()
{
	dGrid = ds_grid_create( MP_GRID.mpGridW, MP_GRID.mpGridH );
	Trace( dGrid[# 0, 0] );
	TownplannerAddObjects(obj_gameobject);
}

//call during init state to add all objects with this name to the town planner grid
function TownplannerAddObjects(_objectName)
{
	var _len = instance_number(_objectName);
	if ( _len > 0 )
	{
		for ( var i = 0; i < _len; i++ )
		{
			var _inst = instance_find( _objectName, i );
			//reference this object's metadata in the town planner
			with (_inst) 
			{
				myData = new BuildTownplannerGameobject(id);
				Trace("INST ", id, " data = ", myData);
				
				TownPlannerSetData(myData);
			}
		}
	}
}

//data setter for the town planning grid, also allows you to quickly clear the mp grid when used with object delete
function TownPlannerSetData(_data,_clear = false)
{
	var _len = array_length(_data.footprint);
	if ( _len > 0 )
	{
		for ( var i = 0; i < _len; i++ )
		{
			var _x = _data.footprint[i].x,
				_y = _data.footprint[i].y;
			obj_controller_game.dGrid[# _x, _y] = _clear ? 0 : _data;
			
			if ( _clear ) PathfinderClearCell(_x,_y);
		}
	}
}

function TownplannerGetData(_x,_y)
{
	var _cx = GetCellAtPixelX(_x),
		_cy = GetCellAtPixelY(_y);
		
	return D_GRID[# _cx, _cy];
}

function BuildTownplannerGameobject(_id) constructor
{	
	//store which cells we occupy	
	cellX1 = GetCellAtPixelX(_id.bbox_left);
	cellX2 = GetCellAtPixelX(_id.bbox_right);
	cellY1 = GetCellAtPixelY(_id.bbox_top);
	cellY2 = GetCellAtPixelY(_id.bbox_bottom);
	
	footprint = [];
	for ( var _xx = cellX1; _xx <= cellX2; _xx++ )
	{
		for ( var _yy = cellY1; _yy <= cellY2; _yy++ )
		{
			array_push( footprint, { x: _xx, y: _yy } );
		}
	}
	
	//object information
	objectID = _id;
	objectClass = _id.objectClass;
	
	instID = _id;
}