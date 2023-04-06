/// @param start
/// @param end
/// @param position
/// @param x1
/// @param y1
/// @param x2
/// @param y2
function BezierCubicDirect(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _start = argument0;
	var _end   = argument1;
	var _pos   = argument2;
	var _x1    = argument3;
	var _y1    = argument4;
	var _x2    = argument5;
	var _y2    = argument6;

	var _t = 0;
	if (_pos >= 1) 
	{
	    _t = 1;
	}
	else if (_pos > 0)
	{
	    var _p1 = clamp(_x1, 0, 1);
	    var _p2 = clamp(_x2, 0, 1);
    
	    _t = BezierSolveCubic(3*_p1 - 3*_p2 + 1, -6*_p1 + 3*_p2, 3*_p1, -_pos);
	    if (_t == undefined) return undefined;
	}

	var _inv_t = 1 - _t;
	var _t2 = _t*_t;
	return lerp(_start, _end, 3*_t*_inv_t*_inv_t*_y1 + 3*_t2*_inv_t*_y2 + _t2*_t);




}
