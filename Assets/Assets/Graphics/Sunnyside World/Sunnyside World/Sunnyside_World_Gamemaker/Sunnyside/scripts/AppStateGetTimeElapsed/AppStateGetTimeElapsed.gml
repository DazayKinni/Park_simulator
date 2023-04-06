function AppStateGetTimeElapsed()
{
    if (!instance_exists(obj_app)) return -infinity;
    return current_time - obj_app.stateStartTime;
}