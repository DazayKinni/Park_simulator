/// @param function

function DistortionSetUpdateFunc(_function)
{
    __DistortionInit();
    
    global.__distortionHandler.__function = _function;
}