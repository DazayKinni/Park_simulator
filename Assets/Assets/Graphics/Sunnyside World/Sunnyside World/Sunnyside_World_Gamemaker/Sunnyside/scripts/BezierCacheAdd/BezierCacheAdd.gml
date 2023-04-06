/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param [curveName]
function BezierCacheAdd() {

	var _x1   = argument[0];
	var _y1   = argument[1];
	var _x2   = argument[2];
	var _y2   = argument[3];
	var _name = ((argument_count > 4) && (argument[4] != undefined))? argument[4] : ("anonymous " + string(ds_map_size(global.__bezier_cache_name)));

	var _array = array_create(BEZIER_CACHE_ACCURACY, 0.0);
	_array[@ BEZIER_CACHE_ACCURACY-1] = 1.0;

	var _i = 1;
	repeat(BEZIER_CACHE_ACCURACY-2)
	{
	    var _pos = _i/BEZIER_CACHE_ACCURACY;
    
	    var _p1 = clamp(_x1, 0, 1);
	    var _p2 = clamp(_x2, 0, 1);
	    var _t = BezierSolveCubic(3*_p1 - 3*_p2 + 1, -6*_p1 + 3*_p2, 3*_p1, -_pos);
    
	    var _inv_t = 1 - _t;
	    var _t2 = _t*_t;
	    _array[@ _i] = 3*_t*_inv_t*_inv_t*_y1 + 3*_t2*_inv_t*_y2 + _t2*_t;
    
	    ++_i;
	}

	global.__bezier_cache_name[? _name] = _array;
	global.__bezier_cache_value[? _x1 + 1000*(_y1 + 1000*(_x2 + 1000*_y2))] = _array;
	if (BEZIER_CACHE_DEBUG_LEVEL >= 2) Trace("Bezier Cache: Added ", _x1, ",", _y1, ", ", _x2, ",", _y2, " as \"", _name, "\"");

	return _array;


}
