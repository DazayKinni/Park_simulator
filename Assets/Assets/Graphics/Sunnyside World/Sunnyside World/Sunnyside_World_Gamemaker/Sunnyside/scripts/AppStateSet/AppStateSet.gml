/// @param state

function AppStateSet(_state)
{
    if (!instance_exists(obj_app))
    {
        TraceError("obj_app doesn't exist");
        return;
    }
    
    with(obj_app)
    {
        if (state != _state)
        {
            TraceCallstack("Setting app state to ", AppStateGetName(_state));
            stateStartTime = current_time;
        }
        
        state = _state;
    }
}