__PopCaptionSystem();

function __PopCaptionSystem()
{
    static _initialized = false;
    if (_initialized) return;
    _initialized = true;
    
    global.__popCaptionSearchString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!,.<>? ";
    
    global.__popCaptionFont           = spr_font_pop_caption;
    global.__popCaptionFontWidthArray = [];
    global.__popCaptionFontSpaceWidth = 50;
    
    var _widthOffset  = 25;
    var _spriteWidth  = sprite_get_width(global.__popCaptionFont) - _widthOffset;
    var _heightFactor = 0;
    
    var _i = 0;
    repeat(string_length(global.__popCaptionSearchString))
    {
        var _char = string_char_at(global.__popCaptionSearchString, _i+1);
        
        if ((_char == "P")
        ||  (_char == "V")
        ||  (_char == "W")
        ||  (_char == "Y"))
        {
            var _offset = 0.9;
        }
        else
        {
            var _offset = 1;
        }
        
		var _uvs = sprite_get_uvs(global.__popCaptionFont, _i);
        global.__popCaptionFontWidthArray[@ _i] = floor(_uvs[6]*_spriteWidth*_offset);
        
        ++_i;
    }
}