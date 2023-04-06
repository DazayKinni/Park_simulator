/// @param string
/// @param colour

function PopCaption(_string, _colour) constructor
{
    __sourceString = _string;
    __colour       = _colour;
    
    __finished = false;
    
    __typeTimer       = 0;
    __glyphsToDisplay = 0;
    
    __whiteflashFactor = 0;
    __whiteflashTimer  = 0;
    
    __glyphArray = [];
    
    __xOffset = undefined;
    
    
    
	var _hue = color_get_hue(_colour);
	var _sat = color_get_saturation(_colour);
	var _val = color_get_value(_colour);
    
    var _middleChar = floor(0.5*string_length(__sourceString));
    var _colShift   = 100 / _middleChar;
    var _scaleShift = 0.6 / (_middleChar + 1);
    
    var _scale = 1;
    
    var _x = 0;
    
    var _i = 1;
    repeat(string_length(__sourceString))
    {
        var _char = string_char_at(__sourceString, _i);
        if (_char == " ")
        {
            _x += floor(_scale*global.__popCaptionFontSpaceWidth);
        }
        else
        {
            var _searchPos = string_pos(_char, global.__popCaptionSearchString);
            if (_searchPos >= 1)
            {
                var _glyph = new __PopCaptionGlyph();
                array_push(__glyphArray, _glyph);
            
                with(_glyph)
                {
                    __image  = _searchPos-1;
                    __x      = _x;
            		__colour = make_color_hsv(_hue, _sat, _val);
                    __scale  = _scale;
                    
                    _x += floor(_scale*global.__popCaptionFontWidthArray[_searchPos-1]);
                    
            		if (_i <= _middleChar) 
            		{
            			_sat   -= _colShift;
            			_scale -= _scaleShift;
            		}
            		else 
            		{
            			_sat   += _colShift;
            			_scale += _scaleShift;
            		}
                }
            }
        }
        
        ++_i;
    }
    
    __xOffset = -0.5*_x;
    
    if (array_length(__glyphArray) >= 2)
    {
        __glyphArray[0].__startChar = true;
        __glyphArray[array_length(__glyphArray)-1].__endChar = true;
    }
    
    
    
    static GetString = function()
    {
        return __sourceString;
    }
    
    static GetFinished = function()
    {
        return __finished;
    }
    
    static Update = function()
    {
        var _typeDelay = 2;
        if (__glyphsToDisplay < array_length(__glyphArray))
        {
            if (__typeTimer < _typeDelay)
            {
                __typeTimer++;
            }
            else
            {
                __glyphsToDisplay++;
                __typeTimer = 0;
            }
        }
        
        var _whiteflashTimerMax = 15;
        if (__whiteflashTimer < _whiteflashTimerMax)
        {
            __whiteflashTimer++;
            __whiteflashFactor = BezierCache(1, 0, __whiteflashTimer / _whiteflashTimerMax, 0.33, 0, 0.67, 1);
        }
        
        var _i = __glyphsToDisplay-1;
        repeat(__glyphsToDisplay)
        {
            __glyphArray[_i].__Update();
            --_i;
        }
        
        if (__glyphArray[array_length(__glyphArray)-1].__finished) __finished = true;
    }
    
    static Draw = function(_x, _y)
    {
        static _u_fMix = shader_get_uniform(__shdPopCaption, "u_fMix");
        
        var _oldFilter = gpu_get_tex_filter();
        gpu_set_tex_filter(true);
        
        shader_push(__shdPopCaption);
        shader_set_uniform_f(_u_fMix, __whiteflashFactor);
        
        var _i = __glyphsToDisplay-1;
        repeat(__glyphsToDisplay)
        {
            __glyphArray[_i].__Draw(_x + __xOffset, _y);
            --_i;
        }
        
        shader_pop();
        gpu_set_tex_filter(_oldFilter);
    }
}