/// @param start
/// @param end
/// @param position
/// @param curveName
function BezierCacheName(argument0, argument1, argument2, argument3) {

	var _start = argument0;
	var _end   = argument1;
	var _pos   = argument2;
	var _name  = argument3;

	if (_pos <= 0) return _start;
	if (_pos >= 1) return _end;

	var _array = global.__bezier_cache_name[? _name];
	if (_array == undefined)
	{
	    show_error(concat("Bezier Cache:\nNo curve called \"", _name, "\" found\n "), false);
	    return _pos;
	}

	_pos *= BEZIER_CACHE_ACCURACY-1;
	var _floor = floor(_pos);
	return lerp(_start, _end, lerp(_array[_floor], _array[_floor+1], frac(_pos)));


}
