/// @param start
/// @param end
/// @param position
/// @param x1
/// @param y1
/// @param x2
/// @param y2
function BezierCache(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _start = argument0;
	var _end   = argument1;
	var _pos   = argument2;
	var _x1    = argument3;
	var _y1    = argument4;
	var _x2    = argument5;
	var _y2    = argument6;

	if (_pos <= 0) return _start;
	if (_pos >= 1) return _end;

	var _array = global.__bezier_cache_value[? _x1 + 1000*(_y1 + 1000*(_x2 + 1000*_y2))];
	if (_array == undefined)
	{
	    if (BEZIER_CACHE_DEBUG_LEVEL >= 2) var _t = get_timer();
	    _array = BezierCacheAdd(_x1, _y1, _x2, _y2);
	    if (BEZIER_CACHE_DEBUG_LEVEL == 1) Trace("Bezier Cache: Warning! Runtime cache of ", _x1, ",", _y1, ", ", _x2, ",", _y2, " (callstack =\"", debug_get_callstack(), "\")");
	    if (BEZIER_CACHE_DEBUG_LEVEL >= 2) Trace("Bezier Cache: Warning! Runtime cache of ", _x1, ",", _y1, ", ", _x2, ",", _y2, " (took ", get_timer() - _t, "us, callstack =\"", debug_get_callstack(), "\")");
	}

	_pos *= BEZIER_CACHE_ACCURACY-1;
	var _floor = floor(_pos);
	return lerp(_start, _end, lerp(_array[_floor], _array[_floor+1], frac(_pos)));


}
