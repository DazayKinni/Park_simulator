function HitflashAttachToSelf(_colour = c_white)
{
    if (variable_instance_exists(id, "hitflash"))
    {
        show_debug_message("Hitflash: Instance " + string(id) + " already has a hitflash controller");
    }
    else
    {
        hitflash = new __ClassHitflash(_colour);
    }
}

function __ClassHitflash(_colour = c_white) constructor
{
    componentR = colour_get_red(  _colour)/255;
    componentG = colour_get_green(_colour)/255;
    componentB = colour_get_blue( _colour)/255;
    
    timer          = 0;
    timerMax       = 5;
    timerOvershoot = 8; //Allow alpha to get higher than the max
    timerDecay     = 1;
    
    alpha    = 0;
    alphaMax = 0.8;
    
    static Add = function(_time = timerMax + timerOvershoot)
    {
        timer = min(timer + _time, timerMax + timerOvershoot);
    }
    
    static Tick = function(_tickSize = 1)
    {
        timer = max(0, timer - _tickSize*timerDecay);
        alpha = min(alphaMax*timer/timerMax, 1);
    }
    
    static DrawStart = function()
    {
        static _u_vFlash = shader_get_uniform(shdHitflash, "u_vFlash");
        
        if (alpha > 0)
        {
            shader_push(shdHitflash);
            shader_set_uniform_f(_u_vFlash, componentR, componentG, componentB, alpha);
        }
    }
    
    static DrawEnd = function()
    {
        if (alpha > 0) shader_pop();
    }
}