/// @param [delay=0]
/// @param [totalLength=18]

function MenuTransform(_delay = 0, _totalLength = 18) constructor
{
    valFrom[0] = 0.90; valTo[0] = 1.10;
    valFrom[1] = 1.10; valTo[1] = 0.95;
    valFrom[2] = 0.95; valTo[2] = 1.00;
    stepMax = array_length(valFrom)-1;
    
    delayMax    = _delay;
    totalLength = _totalLength;
    timerMax    = _totalLength / array_length(valFrom);
    
    run   = true;
    delay = 0;
    step  = 0;
    timer = 0;
    scale = valFrom[0];
    
    draw = false;
    
    Reinitialize(_delay, _totalLength);
    
    
    
    static Reinitialize = function(_delay = 0, _totalLength = 18)
    {
        delayMax    = _delay;
        totalLength = _totalLength;
        timerMax    = _totalLength / array_length(valFrom);
        
        if (delayMax > 0) draw = false;
    }
    
    static Repeat = function()
    {
        run   = true;
        delay = 0;
        step  = 0;
        timer = 0;
        scale = valFrom[0];
    }
    
    static ApplyTransform = function(_xOffset, _yOffset)
    {
    	if (draw)
    	{
    		TransformStart();
    		TransformScale(scale);
    		TransformMove(_xOffset, _yOffset);
    		TransformEnd();
    	}
    }
    
    static Tick = function(_tickSize = 1)
    {
        if (run)
        {
            if (delay < delayMax)
            {
                delay += _tickSize;
            }
            else
            {
                draw = true;
                scale = BezierCache(valFrom[step], valTo[step], timer/timerMax, 0.33, 0, 0.67, 1);
                
                if (timer < timerMax)
                {
                    timer += _tickSize;
                }
                else 
                {
                    if (step < stepMax) 
                    {
                        step++;
                        timer -= timerMax;
                    } 
                    else 
                    {
                        run = false;
                    }
                }
            }
        }
        
        return run;
    }
}