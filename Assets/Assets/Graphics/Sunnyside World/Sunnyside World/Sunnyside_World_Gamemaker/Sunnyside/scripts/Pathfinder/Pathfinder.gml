#macro MP_GRID_CELL_SIZE (obj_controller_game.mpGridCellSize)
#macro MP_GRID (obj_controller_game.mpGrid)

function PathfinderInit()
{
	var _time = current_time;
	
	var _layID = layer_get_id("Land"),
		_mapID = layer_tilemap_get_id(_layID);
		
	layer_set_visible(_layID,false);
		
	mpGridCellSize = 8; //tilemap_get_tile_width(_mapID)
	
	mpGridW = floor(room_width/MP_GRID_CELL_SIZE);
	mpGridH = floor(room_height/MP_GRID_CELL_SIZE);
	
	mpGrid = mp_grid_create( 0, 0, mpGridW, mpGridH, MP_GRID_CELL_SIZE, MP_GRID_CELL_SIZE );
	
	//loop through the "Land" tilemap, and mark any empty tiles as forbidden
	for ( var _xx = 0; _xx < mpGridW; _xx++ )
	{
		for ( var _yy = 0; _yy < mpGridH; _yy++ )
		{
			var _data = tilemap_get_at_pixel(_mapID,_xx*MP_GRID_CELL_SIZE,_yy*MP_GRID_CELL_SIZE);
			if ( _data > 0 ) mp_grid_add_cell( mpGrid, _xx, _yy );
		}
	}
	
	//loop through relevant objects and mark their footprint as forbidden
	PathfinderAddObjects(obj_gameobject);
	
	//check how many cells have been removed from the mp grid
	var _data = new PathfinderGetGridData();	
	Trace( "PathfinderInit removed ", _data.forbidden, "/", _data.size, " cells from mpGrid in ", current_time-_time, "MS" );
}

function PathfinderAddObjects(_objectName)
{
	var _len = instance_number(_objectName);
	if ( _len > 0 )
	{
		for ( var i = 0; i < _len; i++ )
		{
			var _inst = instance_find( _objectName, i );
			if ( _inst.fixedPosition ) mp_grid_add_instances( MP_GRID, _inst, true );
		}
	}
}

function PathfinderClearCell(_x,_y)
{
	mp_grid_clear_cell( MP_GRID, _x, _y );
}

function PathfinderGetGridData() constructor
{
	width = MP_GRID.mpGridW;
	height = MP_GRID.mpGridH;
	size = width*height;
	forbidden = 0;
		
	for ( var _xx = 0; _xx < width; _xx++ )
	{
		for ( var _yy = 0; _yy < height; _yy++ )
		{
			if ( mp_grid_get_cell(MP_GRID,_xx,_yy) == -1 ) forbidden++;
		}
	}

	allowed = size-forbidden;
}

function GetCellAtPixelX(_x)
{
	return floor(_x/MP_GRID_CELL_SIZE);
}

function GetCellAtPixelY(_y)
{
	return floor(_y/MP_GRID_CELL_SIZE);	
}

function PathfinderGetCellX(_x,_mid=false)
{
	var _cx = floor( _x/MP_GRID_CELL_SIZE)*MP_GRID_CELL_SIZE;
	if ( _mid ) _cx += MP_GRID_CELL_SIZE/2;
	return _cx
}

function PathfinderGetCellY(_y,_mid=false)
{
	var _cy = floor( _y/MP_GRID_CELL_SIZE )*MP_GRID_CELL_SIZE;
	if ( _mid ) _cy += MP_GRID_CELL_SIZE/2;
	return _cy
}

function PathFinderExists()
{
	return ( obj_controller_game.mpGrid != undefined )
}