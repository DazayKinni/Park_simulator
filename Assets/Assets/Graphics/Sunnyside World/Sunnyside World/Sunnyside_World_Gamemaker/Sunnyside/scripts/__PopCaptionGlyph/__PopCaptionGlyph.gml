function __PopCaptionGlyph() constructor
{
    __PopCaptionSystem();
    
    __startChar = false;
    __finalChar = false;
    
    __image  = 0;
    __x      = 0;
    __y      = 0;
    __colour = c_white;
    __alpha  = 1;
    __scale  = 1;
    __timer  = 0;
    
    __frame      = 0;
    __frameMax   = 0;
    __outFrame   = 0;
    __scaleFrame = 0;
    
    var _startShake = 5;
    __shakeTimer   = 1;
    __shakeX       = 0;
    __shakeY       = 0;
    __shakeTargetX = irandom_range(-_startShake, _startShake);
    __shakeTargetY = irandom_range(-_startShake, _startShake);
    
    __finished = false;
    
    static __Update = function()
    {
        var _frameMax      = 21; //time the letters will take to move out to their highest position
        var _outFrameMax   = 30; //time the letters will take to move to their lowest position
        var _startShrinkAt = 36; //frame in the whole animation the shrink out time will begin
        var _scaleFrameMax = 10; //time it'll take to shrink sown to nothing
        var _shakeSize     =  3;
        
        ++__timer;
        
        if (__frame < _frameMax)
        {
            ++__frame;
            __y = BezierCache(15, 0, __frame / _frameMax, 0.04, 0, 0, 1);
        }
        else
        {
            if (__outFrame < _outFrameMax)
            {
                ++__outFrame;
                __y = BezierCache(0, 15, __outFrame / _outFrameMax, 1, 0, 1, 1);
            }
        }
        
        if (__shakeTimer > 0)
        {
            --__shakeTimer;
            __shakeX = lerp(__shakeX, __shakeTargetX, 0.25);
            __shakeY = lerp(__shakeY, __shakeTargetY, 0.25);
        }
        else
        {
            __shakeTimer = irandom_range(4, 8);
            if (__startChar)
            {
                __shakeTargetX = random_range(0, _shakeSize);
                __shakeTargetY = random_range(-_shakeSize, 0);
            }
            else if (__finalChar)
            {
                __shakeTargetX = random_range(-_shakeSize, 0);
                __shakeTargetY = random_range(-_shakeSize, 0);
            }
            else
            {
                __shakeTargetX = random_range(-_shakeSize, _shakeSize);
                __shakeTargetY = random_range(-_shakeSize, 0);
            }
        }
        
        //scaling
        if (__timer >= _startShrinkAt)
        {
            if (__scaleFrame < _scaleFrameMax)
            {
                ++__scaleFrame;
                __alpha = BezierCache(1, 0, __scaleFrame / _scaleFrameMax, 0.33, 0, 0.67, 1);
            }
            else
            {
                __finished = true;
            }
        }
    }
    
    static __Draw = function(_x, _y)
    {
        draw_sprite_ext(global.__popCaptionFont, __image, _x + __x + __shakeX, _y + __y + __shakeY, __scale*__alpha, __scale*__alpha, 0, __colour, __alpha);
    }
}