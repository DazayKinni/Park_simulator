/// @param state

function DistortionEnable(_state)
{
    __DistortionInit();
    
    global.__distortionHandler.__enabled = _state;
    DistortionGetSurface();
}