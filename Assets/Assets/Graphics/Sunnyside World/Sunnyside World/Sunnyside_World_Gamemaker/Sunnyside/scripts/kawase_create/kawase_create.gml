/// @param width
/// @param height
/// @param maxIterations
/// @param [array]

function kawase_create(_width, _height, _iterations, _root_array = undefined)
{
	global.__kawase_down_texel_uniform = shader_get_uniform(shd_kawase_down, "u_vTexel");
	global.__kawase_up_texel_uniform   = shader_get_uniform(shd_kawase_up  , "u_vTexel");

	if (_root_array == undefined)
    {
        _root_array = array_create(_iterations, undefined);
    }
    else
    {
        array_resize(_root_array, _iterations);
    }
    
	var _w = _width;
	var _h = _height;
	var _i = 0;
	repeat(_iterations + 1)
	{
	    //Width
	    //Height
	    //Surface
	    //Texel Width
	    //Texel Height
	    var _array = [_w, _h, -1, 1, 1];
	    _root_array[@ _i] = _array;
        
	    __kawase_check_surface(_array);
        
	    _w = _w div 2;
	    _h = _h div 2;
	    ++_i;
	}
    
	return _root_array;
}