/// Constructs a palette swap controller
/// The returned struct contains some methods that should be used to set up and apply a palette swap:
/// 
///  .Add(inColour, outColour, toleranceHue, toleranceSat, toleranceVal, blendFactor)
///    Incrementally adds colours to swap up to the maximum number of swappable colours (defined by PALETTE_SWAP_MAX_COLOURS, usually 4)
///    
///    inColour     | Colour to replace (standard GameMaker BBGGRR value)
///    outColour    | Colour to replace it with (standard GameMaker BBGGRR value)
///    toleranceHue | Maximum divergence from the input hue to apply replacement to. This number should be from 0.0 (exact match only) to 1.0 (accept everything)
///    toleranceSat | Maximum divergence from the input saturation to apply replacement to. This number should be from 0.0 (exact match only) to 1.0 (accept everything)
///    toleranceVal | Maximum divergence from the input value to apply replacement to. This number should be from 0.0 (exact match only) to 1.0 (accept everything)
///    blendFactor  | Weight for the colour replacement blend. Set to 0.0 for a gentle blend, set to 1.0 to completely replace the input colour with the output colour
///    
///  .Set(index, [inColour], [outColour], [toleranceHue], [toleranceSat], [toleranceVal], [blendFactor])
///    Sets the properties of a specific colour in the palette. Use <undefined> for any of the arguments
///    to not change the current value. See above for a description of what each arguments does
/// 
///  .Start()
///    Sets the palette swap shader and the requisite uniforms
/// 
///  .End()
///    Resets the current shader. You should *always* call this after the .Start() method



#macro PALETTE_SWAP_MAX_COLOURS  4  //Make sure you update MAX_COLOURS const in __shdPaletteSwap!



function PaletteSwap() constructor
{
    __count = 0;
    
    __colourInArray        = array_create(PALETTE_SWAP_MAX_COLOURS*3, 0); //vec3
    __colourOutArray       = array_create(PALETTE_SWAP_MAX_COLOURS*3, 0); //vec3
    __colourToleranceArray = array_create(PALETTE_SWAP_MAX_COLOURS*3, 0); //vec3
    __colourBlendArray     = array_create(PALETTE_SWAP_MAX_COLOURS,   0); //float
    
    static Add = function(_inColour, _outColour, _toleranceHue, _toleranceSat, _toleranceVal, _blendFactor)
    {
        if (__count >= PALETTE_SWAP_MAX_COLOURS)
        {
            show_error("PaletteSwap: Reached maximum number of colour swaps\nIncrease PALETTE_SWAP_MAX_COLOURS (=" + string(PALETTE_SWAP_MAX_COLOURS) + " at your own risk\n ", true);
        }
        
        Set(__count, _inColour, _outColour, _toleranceHue, _toleranceSat, _toleranceVal, _blendFactor);
        
        ++__count;
    }
    
    static Set = function(_index, _inColour, _outColour, _toleranceHue, _toleranceSat, _toleranceVal, _blendFactor)
    {
        if (_index >= PALETTE_SWAP_MAX_COLOURS)
        {
            show_error("PaletteSwap: Index " + string(_index) + " is too large\nIncrease PALETTE_SWAP_MAX_COLOURS (=" + string(PALETTE_SWAP_MAX_COLOURS) + " at your own risk\n ", true);
        }
        
        if (is_numeric(_inColour))
        {
            __colourInArray[@ 3*_index  ] = colour_get_hue(       _inColour)/255;
            __colourInArray[@ 3*_index+1] = colour_get_saturation(_inColour)/255;
            __colourInArray[@ 3*_index+2] = colour_get_value(     _inColour)/255;
        }
        
        if (is_numeric(_outColour))
        {
            __colourOutArray[@ 3*_index  ] = colour_get_hue(       _outColour)/255;
            __colourOutArray[@ 3*_index+1] = colour_get_saturation(_outColour)/255;
            __colourOutArray[@ 3*_index+2] = colour_get_value(     _outColour)/255;
        }
        
        if (is_numeric(_toleranceHue))
        {
            __colourToleranceArray[@ 3*_index] = _toleranceHue;
        }
        
        if (is_numeric(_toleranceSat))
        {
            __colourToleranceArray[@ 3*_index+1] = _toleranceSat;
        }
        
        if (is_numeric(_toleranceVal))
        {
            __colourToleranceArray[@ 3*_index+2] = _toleranceVal;
        }
        
        if (is_numeric(_blendFactor))
        {
            __colourBlendArray[@ _index] = _blendFactor;
        }
    }
    
    static Start = function()
    {
        static _u_aColourIn        = shader_get_uniform(__shdPaletteSwap, "u_aColourIn");
        static _u_aColourOut       = shader_get_uniform(__shdPaletteSwap, "u_aColourOut");
        static _u_aColourTolerance = shader_get_uniform(__shdPaletteSwap, "u_aColourTolerance");
        static _u_aBlend           = shader_get_uniform(__shdPaletteSwap, "u_aBlend");
        
        shader_push(__shdPaletteSwap);
        shader_set_uniform_f_array(_u_aColourIn,        __colourInArray);
        shader_set_uniform_f_array(_u_aColourOut,       __colourOutArray);
        shader_set_uniform_f_array(_u_aColourTolerance, __colourToleranceArray);
        shader_set_uniform_f_array(_u_aBlend,           __colourBlendArray);
    }
    
    static End = function()
    {
        shader_pop();
    }
}