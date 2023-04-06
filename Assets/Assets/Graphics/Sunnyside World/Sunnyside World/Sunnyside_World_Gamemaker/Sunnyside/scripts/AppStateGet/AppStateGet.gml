function AppStateGet()
{
    if (!instance_exists(obj_app)) return APP_STATE.UNKNOWN;
    return obj_app.state;
}